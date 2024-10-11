import 'package:flutter/material.dart';
import 'package:ums/presentation/pages/auth/forgot_password/forgot_password.dart';
import 'package:ums/presentation/pages/auth/forgot_password/forgot_password_otp.dart';
import 'package:ums/presentation/pages/auth/forgot_password/forgot_password_submit.dart';
import 'package:ums/presentation/pages/menu/main_menu.dart';
import 'package:ums/presentation/pages/profile/user_profile/user_profile.dart';

import 'presentation/pages/auth/sign_in/sign_in.dart';
import 'presentation/pages/onboarding/onboarding.dart';
import 'presentation/pages/profile/document_profile/document_profile.dart';
import 'presentation/pages/profile/study_profile/study_profile.dart';
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
        '/forgot': (context) => ForgotPasswordScreen(), // Màn hình quên mật khẩu
        '/forgot-otp': (context) =>
            ForgotPasswordOTPScreen(), // Màn hình quên mật khẩu xác thực mã OTP
        '/forgot-submit': (context) =>
            ForgotPasswordSubmitScreen(), // Màn hình quên mật khẩu xác nhận
        '/main-menu': (context) => MainmenuScreen(), // Màn hình menu chính
        '/Thông tin cá nhân': (context) => UserProfileScreen(), // Màn hình thông tin cá nhân
        '/Hồ sơ sinh viên': (context) => DocumentProfileScreen(), // Màn hình hồ sơ sinh viên
        '/Quá trình học tập': (context) => StudyProfileScreen(), //Màn hình quá trình học tập
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
