import 'package:credit_hub_new/src/utils/app_export.dart';

import 'package:flutter/material.dart';

Widget bankPicker() {
  return ListView.builder(
    itemCount: 10, // Số lượng phần tử trong ListView, bạn có thể điều chỉnh theo nhu cầu
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Row(
          children: [
            // Hình ảnh bên trái
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/your_image.png'), // Thay bằng đường dẫn ảnh thực tế
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            // Column bên phải chứa tên, mô tả và kẻ border
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên
                  Text(
                    'Tên ngân hàng', // Thay thế bằng dữ liệu thực tế
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Mô tả
                  Text(
                    'Mô tả ngân hàng', // Thay thế bằng dữ liệu thực tế
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Đoạn kẻ border
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
