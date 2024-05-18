import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "widgets",
      home: Scaffold(
        body: Image.asset(
          "assets/image1.png",
          height: 100,
        ),
      ),
    );
  }
}
