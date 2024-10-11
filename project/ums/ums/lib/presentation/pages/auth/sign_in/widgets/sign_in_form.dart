import 'package:flutter/material.dart';
import 'package:ums/core/constants/validators.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/device.dart';
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
      Navigator.pushReplacementNamed(context, '/main-menu');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDeviceUtils.screenWidth(context);
    double screenHeight = AppDeviceUtils.screenHeight(context);

    return Scaffold(
      backgroundColor: AppColors.bg,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),
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
                  SizedBox(height: screenHeight * 0.02),
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
                  SizedBox(height: screenHeight * 0.065),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.main,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2, vertical: 15),
                    ),
                    onPressed: _signIn,
                    child: Text(
                      AppText.sign_In,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: AppFonts.fontSizeMd,
                        color: AppColors.bg,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/forgot');
                    },
                    child: Text(
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
        ),
      ),
    );
  }
}
