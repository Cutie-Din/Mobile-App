import 'package:flutter/material.dart';
import 'package:ums/core/constants/validators.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/fonts.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _studentIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      String studentId = _studentIdController.text;
      String password = _passwordController.text;
      // Logic xử lý đăng nhập
      Navigator.pushReplacementNamed(context, '/main-menu');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            bottom:
                MediaQuery.of(context).viewInsets.bottom), // Thêm padding bottom dựa vào viewInsets
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: AppSizes.sm * 0.5),
              TextFormField(
                controller: _studentIdController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppText.sign_In_msv,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: AppValidator.validateStudentId,
              ),
              const SizedBox(height: AppSizes.sm * 1.5),
              TextFormField(
                controller: _passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: AppText.sign_In_pass,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: AppValidator.validatePassword,
              ),
              const SizedBox(height: AppSizes.sm * 2),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.main,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                onPressed: _signIn,
                child: const Text(
                  AppText.sign_In,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: AppFonts.fontSizeMd,
                    color: AppColors.bg,
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.sm * 1.5),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/forgot');
                },
                child: const Text(
                  AppText.sign_In_forgot,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: AppColors.main,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
