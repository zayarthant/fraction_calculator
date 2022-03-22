import 'package:flutter/material.dart';

class AnswerComponent extends StatefulWidget {
  const AnswerComponent({Key? key}) : super(key: key);

  @override
  _AnswerComponentState createState() => _AnswerComponentState();
}

class _AnswerComponentState extends State<AnswerComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      child: Text(
        "= 23/42",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
