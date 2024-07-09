// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_textfield.dart';
import 'package:authentication/components/square_tile.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              // Logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(
                height: 50,
              ),
              // Slogan
              Text(
                "Welcome back!",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // Tài khoản
              MyTextfield(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              // Mật khẩu
              MyTextfield(
                controller: passwordController,
                hintText: 'Password',
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
                    Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Nút đăng nhập
              MyButton(
                onTap: signUserIn,
              ),
              const SizedBox(
                height: 50,
              ),
              // Hoặc tiếp tục với
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // Nút đăng nhập bằng google + apple + facebook
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // Nút google
                  SquareTile(imagePath: 'lib/images/google.png'),
                  const SizedBox(
                    width: 25,
                  ),
                  // Nút facebook
                  SquareTile(imagePath: 'lib/images/facebook.png'),
                  const SizedBox(
                    width: 25,
                  ),
                  // Nút apple
                  SquareTile(imagePath: 'lib/images/apple.png'),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              // Không phải thành viên ? Đăng ký ngay
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
