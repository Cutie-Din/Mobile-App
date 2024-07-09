// ignore_for_file: prefer_const_constructors

import 'package:budget_tracker/components/my_button_forget.dart';
import 'package:budget_tracker/components/my_textfield_forget.dart';
import 'package:flutter/material.dart';

import '../components/my_button_login.dart';
import '../components/my_textfield_login.dart';
import '../components/square_tile.dart';

class ForgetPage extends StatelessWidget {
  ForgetPage({super.key});

  // Các controller chỉnh sửa văn bản
  final usernameController = TextEditingController();

  // Phương thức đăng ký người dùng
  void confirmUser() {}

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
                MyTextfieldForget(
                  controller: usernameController,
                  hintText: 'SĐT/Email đã đăng ký',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Mật khẩu
                const SizedBox(
                  height: 10,
                ),
                // Nút đăng ký
                MyButtonForget(
                  onTap: confirmUser,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
