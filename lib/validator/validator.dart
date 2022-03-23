import 'package:fraction/model/keys.enum.dart';
import 'package:fraction/model/sequence.model.dart';
import 'package:fraction/model/types.enum.dart';

class InputValidator {
  static bool operator(SequenceModel lastSequence) {
    if (lastSequence.type == Types.NUMBER) {
      return true;
    }
    return false;
  }

  static bool number(
      List<SequenceModel> sequencesList, SequenceModel sequence) {
    if (sequencesList.isEmpty) {
      if (sequence.key != Keys.Zero) {
        return true;
      }
      return false;
    }
    if (sequencesList.last.type == Types.NUMBER) {
      return true;
    }
    if ((sequencesList.last.type == Types.OPERATOR ||
            sequencesList.last.key == Keys.Fraction) &&
        sequence.key != Keys.Zero) {
      return true;
    }
    return false;
  }

  static bool fraction(SequenceModel lastSequence, bool lock) {
    if (lastSequence.type == Types.NUMBER && !lock) {
      return true;
    }
    return false;
  }
}
