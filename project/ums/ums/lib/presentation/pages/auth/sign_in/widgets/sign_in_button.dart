import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/auth/sign_in/sign_in_bloc.dart';
import '../../../../bloc/auth/sign_in/sign_in_event.dart';
import '../../../../bloc/auth/sign_in/sign_in_state.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        if (state is SignInLoading) {
          return CircularProgressIndicator();
        }
        return ElevatedButton(
          onPressed: () {
            const email = 'example@mail.com'; // Tạm thời đặt cứng để minh họa
            const password = 'password'; // Tạm thời đặt cứng để minh họa
            BlocProvider.of<SignInBloc>(context).add(
              SignInButtonPressed(email: email, password: password),
            );
          },
          child: Text('Sign In'),
        );
      },
    );
  }
}
