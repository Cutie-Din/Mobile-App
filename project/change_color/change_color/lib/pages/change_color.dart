import 'dart:math';

import 'package:flutter/material.dart';

class ChangeColor extends StatefulWidget {
  const ChangeColor({super.key});

  @override
  State<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  Color _backgroundColor = Colors.white;

  void _changebackgroundColor() {
    setState(() {
      _backgroundColor =
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bấm vào đây để đổi màu"),
            ElevatedButton(
              onPressed: _changebackgroundColor,
              child: Text("Đổi màu"),
            ),
          ],
        ),
      ),
    );
  }
}
