import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/device.dart';
import '../../../../../core/constants/fonts.dart';

class DetailButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDeviceUtils.screenWidth(context);

    return Padding(
      padding: EdgeInsets.only(
          top: screenWidth * 0.002, bottom: screenWidth * 0.04), // Responsive padding
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.04, // Responsive vertical padding
            horizontal: screenWidth * 0.2, // Responsive horizontal padding
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          // Add your action here
        },
        child: Text(
          'Yêu cầu cập nhật thông tin',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
