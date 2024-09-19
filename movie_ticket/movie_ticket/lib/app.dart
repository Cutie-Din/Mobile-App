import 'package:flutter/material.dart';
import 'package:movie_ticket/movie_ticket/view/authentication/sign_in/sign_in.dart';
import 'package:movie_ticket/movie_ticket/view/onboarding/onboarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie",
      initialRoute: '/',
      routes: {
        '/signIn': (context) => SignInScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
