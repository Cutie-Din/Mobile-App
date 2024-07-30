import 'package:flutter/material.dart';

class Iconscreen extends StatefulWidget {
  const Iconscreen({super.key});

  @override
  State<Iconscreen> createState() => _IconscreenState();
}

class _IconscreenState extends State<Iconscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "Hi",
        textAlign: TextAlign.center,
      ),
    );
  }
}
