// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:budget_tracker/features/personalization/screens/widgets/stat_expense.dart';
import 'package:budget_tracker/features/personalization/screens/widgets/stat_income.dart';
import 'package:budget_tracker/utils/helpers/helper_functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class StatScreen extends StatefulWidget {
  final int ma_nguoi_dung;
  const StatScreen({super.key, required this.ma_nguoi_dung});

  @override
  _StatScreenState createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  final PageController _pageController = PageController();
  String selectedText = AppTexts.totaldeposit;

  void _onPageChanged(int index) {
    setState(() {
      switch (index) {
        case 0:
          selectedText = AppTexts.totaldeposit;
          break;
        case 1:
          selectedText = AppTexts.totalincome;
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _onTextTap(AppTexts.totaldeposit, 0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: selectedText == AppTexts.totaldeposit
                          ? AppColors.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: selectedText == AppTexts.totaldeposit
                            ? Colors.transparent
                            : AppColors.primary,
                        width: 3,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      AppTexts.totaldeposit,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: selectedText == AppTexts.totaldeposit
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _onTextTap(AppTexts.totalincome, 1),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: selectedText == AppTexts.totalincome
                          ? AppColors.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: selectedText == AppTexts.totalincome
                            ? Colors.transparent
                            : AppColors.primary,
                        width: 3,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      AppTexts.totalincome,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: selectedText == AppTexts.totalincome
                            ? Colors.white
                            : Colors.black,
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
                itemCount: 2,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.primary,
                              width: 3,
                            ),
                          ),
                          child: Center(
                              child: StatExpense(
                                  maNguoiDung: widget.ma_nguoi_dung)));

                    case 1:
                      return Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.primary,
                              width: 3,
                            ),
                          ),
                          child: Center(
                              child: StatIncome(
                                  maNguoiDung: widget.ma_nguoi_dung)));
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
