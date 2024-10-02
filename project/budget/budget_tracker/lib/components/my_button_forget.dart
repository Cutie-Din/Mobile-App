// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButtonForget extends StatelessWidget {
  final void Function()? onTap;
  const MyButtonForget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color(0xFFFF8D6C),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            "Xác nhận",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
