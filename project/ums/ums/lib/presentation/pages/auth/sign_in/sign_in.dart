import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/sign_in/sign_in_bloc.dart';
import 'widgets/sign_in_logo_container.dart';
import 'widgets/sign_in_logo.dart';
import 'widgets/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Column(
        children: [
          // Phần logo với border cong ở dưới
          LogoContainer(),

          // Phần form đăng nhập ở dưới
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: SignInForm(),
            ),
          ),
        ],
      ),
    );
  }
}
