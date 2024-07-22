import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/constants/colors.dart';

List<Map<String, dynamic>> transactionData = [
  {
    'icon': const FaIcon(
      FontAwesomeIcons.burger,
      color: AppColors.light,
    ),
    'color': Colors.yellow[700],
    'name': 'Đồ ăn',
    'totalAmount': '-140.000\đ',
    'date': 'Hôm nay',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.bagShopping,
      color: AppColors.light,
    ),
    'color': Colors.pink,
    'name': 'Mua sắm',
    'totalAmount': '-69.000\đ',
    'date': 'Hôm nay',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.heartCircleCheck,
      color: AppColors.light,
    ),
    'color': Colors.green,
    'name': 'Y tế',
    'totalAmount': '-500.000\đ',
    'date': 'Hôm qua',
  }
];
