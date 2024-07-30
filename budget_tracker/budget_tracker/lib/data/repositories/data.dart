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
    'type': 'Chi',
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
    'type': 'Chi',
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
    'type': 'Chi',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.moneyBill,
      color: AppColors.light,
    ),
    'color': Colors.purple,
    'name': 'Dự án',
    'totalAmount': '+3.000.000\đ',
    'date': 'Hôm qua',
    'type': 'Thu',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.moneyBill,
      color: AppColors.light,
    ),
    'color': Colors.purple,
    'name': 'Lương',
    'totalAmount': '+5.000.000\đ',
    'date': 'Hôm qua',
    'type': 'Thu',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.moneyBill,
      color: AppColors.light,
    ),
    'color': Colors.purple,
    'name': 'Phụ huynh cho',
    'totalAmount': '+10.000.000\đ',
    'date': 'Hôm qua',
    'type': 'Thu',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.peopleGroup,
      color: AppColors.light,
    ),
    'color': Colors.red,
    'name': 'Cá độ',
    'totalAmount': '-10.000.000\đ',
    'date': 'Hôm qua',
    'type': 'Nợ',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.peopleGroup,
      color: AppColors.light,
    ),
    'color': Colors.red,
    'name': 'Xây nhà',
    'totalAmount': '-10.000.000\đ',
    'date': 'Hôm qua',
    'type': 'Nợ',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.peopleGroup,
      color: AppColors.light,
    ),
    'color': Colors.red,
    'name': 'Xe',
    'totalAmount': '-10.000.000\đ',
    'date': 'Hôm qua',
    'type': 'Nợ',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.peopleGroup,
      color: AppColors.light,
    ),
    'color': Colors.red,
    'name': 'PS5',
    'totalAmount': '-10.000.000\đ',
    'date': 'Hôm qua',
    'type': 'Nợ',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.peopleGroup,
      color: AppColors.light,
    ),
    'color': Colors.red,
    'name': 'Máy tính',
    'totalAmount': '-10.000.000\đ',
    'date': 'Hôm qua',
    'type': 'Nợ',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.peopleGroup,
      color: AppColors.light,
    ),
    'color': Colors.red,
    'name': 'Bạn bè',
    'totalAmount': '-10.000.000\đ',
    'date': 'Hôm qua',
    'type': 'Nợ',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.peopleGroup,
      color: AppColors.light,
    ),
    'color': Colors.red,
    'name': 'Xã hội đen',
    'totalAmount': '-10.000.000\đ',
    'date': 'Hôm qua',
    'type': 'Nợ',
  },
];
