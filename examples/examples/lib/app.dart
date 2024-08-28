import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final RxInt counter = 0.obs; // Initialize the counter here

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeSreen(),
    );
  }
}
