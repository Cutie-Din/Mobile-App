import 'package:flutter/material.dart';
import 'package:movie_ticket/movie_ticket/view/authentication/sign_in/sign_in.dart';
import 'package:movie_ticket/movie_ticket/view/authentication/sign_up/sign_up.dart';
import 'package:movie_ticket/movie_ticket/view/authentication/user_profilling_confirm/user_profilling.dart';
import 'package:movie_ticket/movie_ticket/view/onboarding/onboarding.dart';
import 'package:movie_ticket/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie",
      initialRoute: '/',
      routes: {
        '/signIn': (context) => SignInScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/userProfilling': (context) => UserProfillingScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
