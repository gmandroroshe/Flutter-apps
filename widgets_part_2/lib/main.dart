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
        body: Column(
          children: [
            Image.asset(
              "assets/image1.png",
              height: 100,
            ),
            Image.asset(
              "assets/image1.jpeg",
              height: 100,
            ),
            Image.asset(
              "assets/image2.jpeg",
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
