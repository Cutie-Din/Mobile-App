// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class FundScreen extends StatelessWidget {
  const FundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40, // Adjust height as needed
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 3,
                  ),
                ),
                alignment: Alignment.center, // Center align the text
                child: Text(
                  AppTexts.homeAppFund,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 3,
                  ),
                ),
                alignment: Alignment.center, // Center align the text
                child: Text(
                  "Ngân sách",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
