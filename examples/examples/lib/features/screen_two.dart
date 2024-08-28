import 'package:examples/features/controller/count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final countController = Get.find<Count>();

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text("Screen Two"),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                countController.increment();
              }, // Increase the counter
              child: Icon(Icons.add),
              heroTag: 'Tăng',
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                countController.decrease();
              }, // Decrease the counter
              child: Icon(Icons.remove),
              heroTag: 'Giảm',
            ),
          ],
        ),
      ),
    );
  }
}
