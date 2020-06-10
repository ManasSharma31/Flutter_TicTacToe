import 'package:flutter/material.dart';
import 'package:tik_tok/Screens/IntroScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: IntroScreen());
  }
}
