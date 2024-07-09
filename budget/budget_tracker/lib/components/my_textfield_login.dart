// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextfieldLogin extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextfieldLogin({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color: Color(0xFFFF8D6C),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color: Color(0xFFFF8D6C),
            ),
          ),
          fillColor: Color(0xFFFF8D6C),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
