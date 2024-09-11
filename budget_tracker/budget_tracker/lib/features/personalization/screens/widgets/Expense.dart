// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/fund_controller.dart';

class Expense extends StatefulWidget {
  const Expense({
    super.key,
  });

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final FundController fundController = Get.find(); // Get the FundController

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              CupertinoIcons.arrow_up,
              size: 12,
              color: AppColors.error,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppTexts.homeExpense,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            Obx(() {
              return Text(
                NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(
                    fundController.totalChiAmount.value ??
                        0), // Display formatted total Chi
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
