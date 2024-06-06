import 'package:flutter/material.dart';

class DarkWhitePage extends StatefulWidget {
  const DarkWhitePage({super.key});

  @override
  State<DarkWhitePage> createState() => _DarkWhitePageState();
}

class _DarkWhitePageState extends State<DarkWhitePage> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch(
          value: _isDarkMode,
          onChanged: (value) {
            setState(() {
              _isDarkMode = true;
            });
          },
        ),
      ),
    );
  }
}
