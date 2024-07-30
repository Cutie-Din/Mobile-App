// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:budget_tracker/features/personalization/screens/widgets/Chart.dart';
import 'package:budget_tracker/utils/helpers/helper_functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class StatScreen extends StatefulWidget {
  const StatScreen({super.key});

  @override
  _StatScreenState createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  PageController _pageController = PageController();
  String selectedText = AppTexts.deposit;

  void _onPageChanged(int index) {
    setState(() {
      switch (index) {
        case 0:
          selectedText = AppTexts.deposit;
          break;
        case 1:
          selectedText = AppTexts.debt;
          break;
        case 2:
          selectedText = AppTexts.income;
          break;
      }
    });
  }

  void _onTextTap(String text, int index) {
    setState(() {
      selectedText = text;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _onTextTap(AppTexts.deposit, 0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: selectedText == AppTexts.deposit
                          ? AppColors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      AppTexts.deposit,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: selectedText == AppTexts.deposit
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _onTextTap(AppTexts.debt, 1),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: selectedText == AppTexts.debt
                          ? AppColors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      AppTexts.debt,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: selectedText == AppTexts.debt
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _onTextTap(AppTexts.income, 2),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: selectedText == AppTexts.income
                          ? AppColors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      AppTexts.income,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: selectedText == AppTexts.income
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: 3,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(child: Text("Chi tiêu")));
                    case 1:
                      return Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(child: Text("Nợ")));
                    case 2:
                      return Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(child: Text("Thu nhập")));
                    default:
                      return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
