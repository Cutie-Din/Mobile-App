import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/device.dart';
import '../../../../../core/constants/fonts.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDeviceUtils.screenWidth(context);

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
      child: Column(
        children: [
          buildInfoRow('Ngày sinh', '01/01/20xx'),
          buildInfoRow('Giới tính', 'Nam'),
          buildInfoRow('Quốc tịch', 'Việt Nam'),
          buildInfoRow('Số điện thoại', '123456789'),
          buildInfoRow('Email', 'xxx@gmail.com'),
          buildInfoRow('Hệ đào tạo', 'Đại học chính quy'),
          buildInfoRow('Chuyên ngành', 'Công nghệ thông tin'),
          buildInfoRow('Niên khoá', '2020-2024'),
          buildInfoRow('Khoá học', '2020'),
          buildInfoRow('HK thường trú', 'Quan Hoa, Cầu Giấy, Hà Nội'),
          buildInfoRow('Nơi ở hiện nay', 'Quan Hoa, Cầu Giấy, Hà Nội'),
          buildInfoRow('Đối tượng ưu tiên', 'Không'),
          buildInfoRow('Đối tượng miễn giảm', 'Không'),
        ],
      ),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: AppFonts.fontSizeSm,
              fontWeight: AppFonts.bold,
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: AppFonts.fontSizeSm,
              fontWeight: AppFonts.bold,
              color: AppColors.main,
            ),
          ),
        ],
      ),
    );
  }
}
