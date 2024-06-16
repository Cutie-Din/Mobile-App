// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Hình ảnh sản phẩm
          Image.asset(
            shoe.imagePath,
            height: 240,
          ),
          // Mô tả sản phẩm

          // Giá + Chi tiết

          // Nút thêm giỏ hàng
        ],
      ),
    );
  }
}
