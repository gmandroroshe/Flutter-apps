import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'new app',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
