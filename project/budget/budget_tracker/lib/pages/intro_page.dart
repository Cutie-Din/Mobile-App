// ignore_for_file: prefer_const_constructors

import 'package:budget_tracker/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Image.asset(
                'lib/assets/images/Logo.png',
                height: 360,
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            // title
            Text(
              'FORTUNE CAT',
              style: TextStyle(
                fontFamily: "Anton",
                fontSize: 40,
                color: Color(0xFFFF8D6C),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // start now button
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFF8D6C),
                    borderRadius: BorderRadius.circular(20)),
                width: 150,
                padding: const EdgeInsets.all(25),
                child: const Center(
                  child: const Text(
                    'Bắt đầu',
                    style: TextStyle(
                      fontFamily: "Anton",
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
