// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:budget_tracker/features/authentication/controller/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  LogoutController logoutController = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tài khoản",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Cài đặt'),
            onTap: () {
              // Add your settings action here
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Giới thiệu'),
            onTap: () {
              // Add your about action here
            },
          ),
          ListTile(
            leading: Icon(Icons.support_agent),
            title: Text('Hỗ trợ'),
            onTap: () {
              // Add your support action here
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Đăng xuất'),
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (ctx) {
                  return AlertDialog(
                    title: Text('Bạn có chắc chắn muốn đăng xuất?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          Get.find<LogoutController>().logout();
                        },
                        child: Text('Đồng ý'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text('Huỷ'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
