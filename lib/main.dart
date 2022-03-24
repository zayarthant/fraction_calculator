import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fraction/main.screen.dart';
import 'package:fraction/provider/brain.provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BrainProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Fraction Calculator",
          theme: ThemeData(
              brightness: Brightness.dark, primaryColor: Colors.white),
          home: MainScreen()),
    );
  }
}
