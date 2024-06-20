import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text("Male Icon"),
                  Text("Male"),
                ],
              ),
              Column(
                children: [
                  Text("Female Icon"),
                  Text("Female"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
