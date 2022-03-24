import 'package:flutter/material.dart';
import 'package:fraction/component/answer.component.dart';
import 'package:fraction/component/appbar.component.dart';
import 'package:fraction/component/display.component.dart';
import 'package:fraction/component/keyboard.component.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DisplayComponent(),
            AnswerComponent(),
            KeyboardComponent(),
          ],
        ),
      ),
    );
  }
}
