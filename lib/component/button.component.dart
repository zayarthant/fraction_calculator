import 'package:flutter/material.dart';
import 'package:fraction/model/sequence.model.dart';
import 'package:fraction/model/types.enum.dart';
import 'package:fraction/provider/brain.provider.dart';
import 'package:provider/provider.dart';

class ButtonComponent extends StatelessWidget {
  final SequenceModel _sequence;

  ButtonComponent(this._sequence);

  ButtonStyle style() {
    return TextButton.styleFrom(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      backgroundColor: _getBackground(),
      primary: _getPrimaryColor(),
      shadowColor: Colors.red,
      textStyle: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w900,
      ),
      elevation: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BrainProvider>(
      builder: (context, brain, _) => Container(
        margin: EdgeInsets.all(4),
        child: TextButton(
          style: style(),
          onPressed: () {
            brain.declare(_sequence);
          },
          child: Text(_sequence.value),
        ),
      ),
    );
  }

  Color _getBackground() {
    if (_sequence.type == Types.COMMAND) {
      return Colors.orange;
    }
    return Colors.black;
  }

  Color _getPrimaryColor() {
    if (_sequence.type == Types.COMMAND) {
      return Colors.black;
    }
    return Colors.white;
  }
}
