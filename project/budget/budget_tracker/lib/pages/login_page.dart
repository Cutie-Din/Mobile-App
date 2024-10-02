// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:budget_tracker/pages/forget_page.dart';
import 'package:budget_tracker/pages/register_page.dart';
import 'package:flutter/material.dart';

import '../components/my_button_login.dart';
import '../components/my_textfield_login.dart';
import '../components/square_tile.dart';

final _formKey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Các controller chỉnh sửa văn bản
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Phương thức đăng nhập người dùng
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
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
                  MyTextfieldLogin(
                    controller: usernameController,
                    hintText: 'SĐT/Email',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Mật khẩu
                  MyTextfieldLogin(
                    controller: passwordController,
                    hintText: 'Mật khẩu',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Quên mật khẩu
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPage(),
                            ),
                          ),
                          child: Text(
                            "Quên mật khẩu?",
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Nút đăng nhập
                  MyButtonLogin(
                    onTap: signUserIn,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Hoặc tiếp tục với
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
                            "Hoặc tiếp tục với",
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
                  const SizedBox(
                    height: 25,
                  ),
                  // Không phải thành viên ? Đăng ký ngay
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Không phải thành viên?',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        ),
                        child: const Text(
                          'Đăng ký ngay',
                          style: TextStyle(
                            color: Color(0xFFFF8D6C),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
