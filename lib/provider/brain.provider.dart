import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fraction/model/keys.enum.dart';
import 'package:fraction/model/rootNode.model.dart';
import 'package:fraction/model/sequence.model.dart';
import 'package:fraction/model/types.enum.dart';
import 'package:fraction/validator/validator.dart';

class BrainProvider extends ChangeNotifier {
  String _display = '';
  List<SequenceModel> _sequences = List.empty();
  RootNode? node;
  int unClosed = 0;
  bool closureDemanded = true;
  bool lockParentheses = false;
  bool operable = true;

  String get display => _display;

  List<SequenceModel> get sequences => _sequences;

  void declare(SequenceModel sequence) {
    HapticFeedback.lightImpact();
    switch (sequence.type) {
      case Types.OPERATOR:
        _operator(sequence);
        break;
      case Types.NUMBER:
        _number(sequence);
        break;
      case Types.PARENTHESES:
        _parentheses(sequence);
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
    if (!InputValidator.operator(this._sequences.last)) {
      return;
    }
    this._sequences.add(sequence);
    this._display = this._display + sequence.value;
    notifyListeners();
  }

  void _number(SequenceModel sequence) {
    if (!InputValidator.number(this._sequences.last, sequence)) {
      return;
    }
    this._sequences.add(sequence);
    this._display = this._display + sequence.value;
    notifyListeners();
  }

  void _parentheses(SequenceModel sequence) {
    if (!InputValidator.parentheses(
      this._sequences.last,
      sequence,
      this.unClosed,
      this.lockParentheses,
      this.closureDemanded,
    )) {
      return;
    }
    this._sequences.add(sequence);
    this._display = this._display + sequence.value;
    notifyListeners();
  }

  void _fraction(SequenceModel sequence) {
    if (!InputValidator.fraction(this._sequences.last)) {
      return;
    }
    this._sequences.add(sequence);
    this._display = this._display + sequence.value;
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
      case Keys.Reduction:
        break;
      default:
        return;
    }
    notifyListeners();
  }

  void _allClear() {
    _sequences = List.from(
      [SequenceModel(type: Types.PARENTHESES, key: Keys.Open, value: '(')],
    );
    _display = '(';
  }

  void _backSpace() {
    if (_sequences.length < 2) {
      return;
    }
    _sequences.removeLast();
    _display = _display.substring(0, _display.length - 1);
  }
}
