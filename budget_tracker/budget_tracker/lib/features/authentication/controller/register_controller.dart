// ignore_for_file: non_constant_identifier_names, unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController eOrPController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> register() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse('http://qltcapi.tasvietnam.vn/api/user/Register');
      Map body = {
        "SoDienThoai": eOrPController.text,
        "Password": passwordController.text,
        "ten_nguoi_dung": nameController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString('token', token);
          nameController.clear();
          eOrPController.clear();
          passwordController.clear();
        } else {
          throw jsonDecode(response.body)["message"] ?? "Đã có lỗi xảy ra";
        }
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
          });
    }
  }
}
