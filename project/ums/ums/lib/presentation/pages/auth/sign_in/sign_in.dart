import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/sign_in/sign_in_bloc.dart';
import 'widgets/sign_in_button.dart';
import 'widgets/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: BlocProvider(
        create: (context) => SignInBloc(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInForm(), // Form nhập email và password
              SizedBox(height: 20),
              SignInButton(), // Nút đăng nhập
            ],
          ),
        ),
      ),
    );
  }
}
