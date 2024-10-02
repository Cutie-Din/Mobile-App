import 'package:examples/features/controller/count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final countController = Get.find<Count>(); // This will work now

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text("Screen One"),
        ),
        body: Center(
          child: Obx(() => Text(
                "Đếm: ${countController.counter.value}",
                style: TextStyle(fontSize: 24),
              )),
        ),
      ),
    );
  }
}
