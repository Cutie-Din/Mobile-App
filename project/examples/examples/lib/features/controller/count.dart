import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Count extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter.value++;
  }

  void decrease() {
    counter.value--;
  }
}
