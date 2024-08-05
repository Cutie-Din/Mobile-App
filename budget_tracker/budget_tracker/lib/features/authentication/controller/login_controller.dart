// ignore_for_file: non_constant_identifier_names, unused_field, prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:budget_tracker/features/personalization/screens/home_screen.dart';
import 'package:budget_tracker/features/personalization/screens/main_screen.dart';

import 'package:budget_tracker/utils/validators/validation.dart'; // Ensure this import is correct
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController eOrPController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse('http://qltcapi.tasvietnam.vn/api/user/login');
      Map body = {
        "SoDienThoai": eOrPController.text,
        "Password": passwordController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final userID = json['ma_nguoi_dung'] ?? '??';
        final username = json['ten_nguoi_dung'] ?? '??';

        eOrPController.clear();
        passwordController.clear();
        Get.off(() => HomeScreen(
              ma_nguoi_dung: userID,
              ten_nguoi_dung: username,
            ));
      } else {
        throw jsonDecode(response.body)["message"] ?? "Đã có lỗi xảy ra";
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Thông báo'),
            contentPadding: EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }
}
