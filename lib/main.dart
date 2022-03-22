import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fraction/buttonAction.notifier.dart';
import 'package:fraction/component/answer.component.dart';
import 'package:fraction/component/bar.component.dart';
import 'package:fraction/component/display.component.dart';
import 'package:fraction/component/keyboard.component.dart';
import 'package:fraction/provider/brain.provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fraction Calculator",
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.white),
      home: Scaffold(
        appBar: AppBarComponent(),
        body: ChangeNotifierProvider(
          create: (context) => BrainProvider(),
          child: Container(
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
        ),
      ),
    );
  }
}
