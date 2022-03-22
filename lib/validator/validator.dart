import 'package:fraction/model/keys.enum.dart';
import 'package:fraction/model/sequence.model.dart';
import 'package:fraction/model/types.enum.dart';

class InputValidator {
  static bool operator(SequenceModel lastSequence) {
    if (lastSequence.key == Keys.Close || lastSequence.type == Types.NUMBER) {
      return true;
    }
    return false;
  }

  static bool number(SequenceModel lastSequence, SequenceModel sequence) {
    if (lastSequence.type == Types.NUMBER) {
      return true;
    }
    if (sequence.key == Keys.Zero) {
      return false;
    }
    if (lastSequence.key == Keys.Open || lastSequence.type == Types.OPERATOR || lastSequence.key == Keys.Fraction) {
      return true;
    }
    return false;
  }

  static bool parentheses(SequenceModel lastSequence, SequenceModel sequence,
      int unclose, bool lockParentheses, bool closureDemanded) {
    if (lockParentheses) {
      return false;
    }

    if (sequence.key == Keys.Open) {
      if (lastSequence.type == Types.OPERATOR ||
          lastSequence.key == Keys.Open ||
          lastSequence.type == Types.FRACTION) {
        return true;
      }
    }

    if (!closureDemanded) {
      return false;
    }

    if (sequence.key == Keys.Close) {
      if (lastSequence.key == Keys.Close || lastSequence.type == Types.NUMBER) {
        return true;
      }
    }

    return false;
  }

  static bool fraction(SequenceModel lastSequence){
    if(lastSequence.type == Types.NUMBER || lastSequence.key == Keys.Close){
      return true;
    }
    return false;
  }
}
