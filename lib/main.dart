import 'package:flutter/material.dart';
import 'package:noteapp2/view/splash_screeen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreeen(),
    );
  }
}
