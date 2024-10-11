import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/device.dart';
import 'sign_in_logo.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = AppDeviceUtils.screenHeight(context); // Get screen height

    return ClipPath(
      clipper: CustomCurveClipper(),
      child: Container(
        height: screenHeight * 0.45, // Responsive height
        color: AppColors.main,
        child: Center(
          child: LogoHeader(),
        ),
      ),
    );
  }
}

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(size.width * 0.25, size.height, size.width * 0.5, size.height - 40);
    path.quadraticBezierTo(size.width * 0.75, size.height - 80, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
