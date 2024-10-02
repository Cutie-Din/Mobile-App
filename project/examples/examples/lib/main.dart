import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'features/controller/count.dart';

void main() {
  Get.put(Count());
  runApp(const App());
}
