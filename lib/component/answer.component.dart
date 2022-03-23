import 'package:flutter/material.dart';
import 'package:fraction/provider/brain.provider.dart';
import 'package:provider/provider.dart';

class AnswerComponent extends StatefulWidget {
  const AnswerComponent({Key? key}) : super(key: key);

  @override
  _AnswerComponentState createState() => _AnswerComponentState();
}

class _AnswerComponentState extends State<AnswerComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BrainProvider>(
      builder: (context, value, _) => Container(
        width: double.infinity,
        margin: EdgeInsets.all(8),
        child: Text(
          value.answer,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
