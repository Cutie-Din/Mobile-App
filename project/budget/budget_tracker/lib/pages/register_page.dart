// ignore_for_file: prefer_const_constructors

import 'package:budget_tracker/components/my_button_register.dart';
import 'package:budget_tracker/components/my_textfield_register.dart';
import 'package:flutter/material.dart';

import '../components/my_button_login.dart';
import '../components/my_textfield_login.dart';
import '../components/square_tile.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // Các controller chỉnh sửa văn bản
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  // Phương thức đăng ký người dùng
  void signUserUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                // Logo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Image.asset(
                    'lib/assets/images/Logo.png',
                    height: 240,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                // Slogan
                Text(
                  "Tiêu tiền theo cách của bạn!",
                  style: TextStyle(
                    fontFamily: "Anton",
                    fontSize: 20,
                    color: Color(0xFFFF8D6C),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // Tài khoản
                MyTextfieldRegister(
                  controller: usernameController,
                  hintText: 'SĐT/Email',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Mật khẩu
                MyTextfieldRegister(
                  controller: passwordController,
                  hintText: 'Mật khẩu',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Xác nhận mật khẩu
                MyTextfieldRegister(
                  controller: confirmController,
                  hintText: 'Xác nhận lại mật khẩu',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Nút đăng ký
                MyButtonRegister(
                  onTap: signUserUp,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xFFFF8D6C),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Hoặc đăng ký bằng",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xFFFF8D6C),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Nút đăng nhập bằng google + apple + facebook
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // Nút google
                    SquareTile(imagePath: 'lib/assets/images/google.png'),
                    const SizedBox(
                      width: 25,
                    ),
                    // Nút facebook
                    SquareTile(imagePath: 'lib/assets/images/facebook.png'),
                    const SizedBox(
                      width: 25,
                    ),
                    // Nút apple
                    SquareTile(imagePath: 'lib/assets/images/apple.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
