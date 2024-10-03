import 'package:flutter/material.dart';

import 'presentation/pages/auth/sign_in/sign_in.dart';
import 'presentation/pages/onboarding/onboarding.dart';
import 'presentation/pages/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UMS",
      initialRoute: '/',
      routes: {
        '/sign-in': (context) => SignInScreen(), // Màn hình đăng nhập
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
