import 'package:flutter/material.dart';
import 'package:fraction/component/button.component.dart';
import 'package:fraction/model/keys.enum.dart';
import 'package:fraction/model/sequence.model.dart';
import 'package:fraction/model/types.enum.dart';

class KeyboardComponent extends StatelessWidget {
  const KeyboardComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.COMMAND,
                  key: Keys.AllClear,
                  value: 'AC',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.COMMAND,
                  key: Keys.BackSpace,
                  value: 'DEL',
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "MandalarSoft",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.NUMBER,
                  key: Keys.Number,
                  value: '1',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.NUMBER,
                  key: Keys.Number,
                  value: '2',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.NUMBER,
                  key: Keys.Number,
                  value: '3',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.FRACTION,
                  key: Keys.Fraction,
                  value: '/',
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.NUMBER,
                  key: Keys.Number,
                  value: '4',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.NUMBER,
                  key: Keys.Number,
                  value: '5',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.NUMBER,
                  key: Keys.Number,
                  value: '6',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.OPERATOR,
                  key: Keys.Addition,
                  value: '+',
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.NUMBER,
                  key: Keys.Number,
                  value: '7',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.NUMBER,
                  key: Keys.Number,
                  value: '8',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.NUMBER,
                  key: Keys.Number,
                  value: '9',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.OPERATOR,
                  key: Keys.Subtraction,
                  value: '-',
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.NUMBER,
                  key: Keys.Zero,
                  value: '0',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.OPERATOR,
                  key: Keys.Multiplication,
                  value: '×',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.OPERATOR,
                  key: Keys.Division,
                  value: '÷',
                ),
              ),
            ),
            Expanded(
              child: ButtonComponent(
                SequenceModel(
                  type: Types.COMMAND,
                  key: Keys.Answer,
                  value: '=',
                ),
              ),
            ),
          ],
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       flex: 2,
        //       child: ButtonComponent(
        //         SequenceModel(
        //           type: Types.COMMAND,
        //           key: Keys.Reduction,
        //           value: 'RED',
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: ButtonComponent(
        //         SequenceModel(
        //           type: Types.COMMAND,
        //           key: Keys.Answer,
        //           value: 'FRA /',
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: ButtonComponent(
        //         SequenceModel(
        //           type: Types.COMMAND,
        //           key: Keys.Answer,
        //           value: 'DEC .',
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
