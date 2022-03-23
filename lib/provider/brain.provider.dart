import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fraction/math/Fraction.dart';
import 'package:fraction/model/domain.model.dart';
import 'package:fraction/model/fraction.model.dart';
import 'package:fraction/model/keys.enum.dart';
import 'package:fraction/model/sequence.model.dart';
import 'package:fraction/model/types.enum.dart';
import 'package:fraction/model/value.model.dart';
import 'package:fraction/validator/validator.dart';

class BrainProvider extends ChangeNotifier {
  String _display = '';
  String _answer = '';
  List<SequenceModel> _sequences = List.empty(growable: true);
  List<DomainModel> _domainSequence = List.empty(growable: true);
  int _readIndex = 0;
  bool _lock = false;

  @override
  void notifyListeners() {
    if (_sequences.isEmpty) {
      _readIndex = 0;
      _domainSequence.clear();
    } else if (_domainSequence.isEmpty) {
      _domainSequence.add(DomainModel(
        _sequences.last.type,
        _sequences.last.key,
        _sequences.last.value,
      ));
      _readIndex++;
    } else if (_sequences.length > _readIndex) {
      if (_sequences.last.type == Types.NUMBER &&
          _domainSequence.last.type == Types.NUMBER) {
        _domainSequence.last.put(_sequences.last.value);
      } else {
        _domainSequence.add(DomainModel(
          _sequences.last.type,
          _sequences.last.key,
          _sequences.last.value,
        ));
      }
      _readIndex++;
    } else if (_sequences.length < _readIndex) {
      if (_sequences.last.type == Types.NUMBER) {
        _domainSequence.last.pop();
      } else {
        _domainSequence.removeLast();
      }
      _readIndex--;
    }

    super.notifyListeners();
  }

  void declare(SequenceModel sequence) {
    HapticFeedback.lightImpact();
    switch (sequence.type) {
      case Types.OPERATOR:
        _operator(sequence);
        break;
      case Types.NUMBER:
        _number(sequence);
        break;
      case Types.FRACTION:
        _fraction(sequence);
        break;
      case Types.COMMAND:
        _command(sequence);
        break;
    }
  }

  void _operator(SequenceModel sequence) {
    if (this._sequences.isNotEmpty &&
        !InputValidator.operator(this._sequences.last)) {
      return;
    }
    this._sequences.add(sequence);
    this._display = this._display + sequence.value;
    this._lock = false;
    notifyListeners();
  }

  void _number(SequenceModel sequence) {
    if (!InputValidator.number(this._sequences, sequence)) {
      return;
    }
    this._sequences.add(sequence);
    this._display = this._display + sequence.value;
    notifyListeners();
  }

  void _fraction(SequenceModel sequence) {
    if (!InputValidator.fraction(this._sequences.last, _lock)) {
      return;
    }
    this._sequences.add(sequence);
    this._display = this._display + sequence.value;
    _lock = true;
    notifyListeners();
  }

  void _command(SequenceModel sequence) {
    switch (sequence.key) {
      case Keys.AllClear:
        _allClear();
        break;
      case Keys.BackSpace:
        _backSpace();
        break;
      case Keys.Answer:
        _calculate();
        break;
      default:
        return;
    }
    notifyListeners();
  }

  void _calculate() {
    List<ValueModel> list = _domainSequence
        .map((e) =>
            ValueModel(e.key, e.type == Types.NUMBER ? int.parse(e.value) : 0))
        .toList();
    List<FractionModel> fractions = List.empty(growable: true);
    while (list.isNotEmpty) {
      ValueModel numerator = list.first;
      list.removeAt(0);

      if (list.isNotEmpty && list.first.key == Keys.Fraction) {
        list.removeAt(0);
        ValueModel denominator = list.first;
        list.removeAt(0);
        fractions.add(FractionModel(
          Keys.Fraction,
          Fraction(
            numerator: numerator.value,
            denominator: denominator.value,
          ),
        ));
      } else {
        fractions.add(FractionModel(
          Keys.Fraction,
          Fraction(
            numerator: numerator.value,
            denominator: 1,
          ),
        ));
      }

      if (list.isNotEmpty) {
        ValueModel operator = list.first;
        list.removeAt(0);
        fractions.add(FractionModel(
          operator.key,
          Fraction(
            numerator: 0,
            denominator: 0,
          ),
        ));
      }
    }

    // @TEMP

    String result = 'Raw : ';

    fractions.forEach((element) {
      if (element.key == Keys.Fraction) {
        result = result + element.fraction.toString();
      } else {
        result = result + element.key.toString();
      }
    });

    print(result);

    // @TEMP

    List<FractionModel> nextLevel = List.empty(growable: true);
    Fraction? lastResult;

    for (int i = 0; i < fractions.length; i++) {
      FractionModel element = fractions[i];
      if (element.key == Keys.Division) {
        Fraction a = lastResult ?? fractions[i - 1].fraction;
        Fraction b = fractions[i + 1].fraction;
        lastResult = a.div(b);
      } else if (element.key == Keys.Multiplication) {
        Fraction a = lastResult ?? fractions[i - 1].fraction;
        Fraction b = fractions[i + 1].fraction;
        lastResult = a.multi(b);
      } else if (element.key == Keys.Addition ||
          element.key == Keys.Subtraction) {
        nextLevel.add(FractionModel(
            Keys.Fraction, lastResult ?? fractions[i - 1].fraction));
        nextLevel.add(element);
        lastResult = fractions[i + 1].fraction;
      }
    }

    if (lastResult != null) {
      nextLevel.add(FractionModel(Keys.Fraction, lastResult));
      lastResult = null;
    }

    // @TEMP

    String nextResult = 'Next Level : ';

    nextLevel.forEach((element) {
      if (element.key == Keys.Fraction) {
        nextResult = nextResult + element.fraction.toString();
      } else {
        nextResult = nextResult + element.key.toString();
      }
    });

    print(nextResult);

    // @TEMP

    for (int i = 0; i < nextLevel.length; i++) {
      FractionModel element = nextLevel[i];
      if (element.key == Keys.Addition) {
        Fraction a = lastResult ?? nextLevel[i - 1].fraction;
        Fraction b = nextLevel[i + 1].fraction;
        lastResult = a.div(b);
      } else if (element.key == Keys.Subtraction) {
        Fraction a = lastResult ?? nextLevel[i - 1].fraction;
        Fraction b = nextLevel[i + 1].fraction;
        lastResult = a.multi(b);
      }
    }

    if (lastResult == null && nextLevel.isNotEmpty) {
      lastResult = nextLevel.first.fraction;
    }else if(fractions.isNotEmpty){
      lastResult = fractions.first.fraction;
    }

    // @TEMP
    print("Final Answer :  " + lastResult.toString());
    // @TEMP

    if(lastResult != null){
      this._answer = "= " + lastResult.toString();
    }
  }

  void _allClear() {
    _sequences.clear();
    _domainSequence.clear();
    _lock = false;
    _display = '';
    _answer = '';
  }

  void _backSpace() {
    if (_sequences.length < 1) {
      return;
    }
    _sequences.removeLast();
    _display = _display.substring(0, _display.length - 1);
  }

  String get display => _display;

  String get answer => _answer;

  List<SequenceModel> get sequences => _sequences;
}
