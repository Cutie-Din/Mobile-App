import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import 'sign_in_logo.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6, // Chiều cao của phần logo
        color: AppColors.main, // Màu nền của logo
        child: const Center(
          child: LogoHeader(), // Logo và tiêu đề ở giữa
        ),
      ),
    );
  }
}

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Bắt đầu từ góc trên bên trái (nền xanh trên nền trắng)
    path.lineTo(0, size.height - 40); // Di chuyển xuống gần đáy phía trái

    // Vẽ đường cong từ góc trái, nền xanh nằm trên nền trắng
    path.quadraticBezierTo(size.width * 0.25, size.height, size.width * 0.5, size.height - 40);

    // Vẽ đường cong từ góc phải, nền trắng nằm trên nền xanh
    path.quadraticBezierTo(size.width * 0.75, size.height - 80, size.width, size.height - 40);

    // Vẽ tiếp đường thẳng lên đến góc phải trên
    path.lineTo(size.width, 0);

    // Đóng đường dẫn
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // Không cần reclip lại nếu không có thay đổi
  }
}
