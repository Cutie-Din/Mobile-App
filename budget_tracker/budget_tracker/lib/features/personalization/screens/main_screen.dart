// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'dart:math';

import 'package:budget_tracker/data/repositories/data.dart';
import 'package:budget_tracker/features/personalization/screens/add_screen.dart';
import 'package:budget_tracker/features/personalization/screens/stat_screen.dart';
import 'package:budget_tracker/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import 'widgets/Expense.dart';
import 'widgets/Income.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _selectedType = '';
  List<Map<String, dynamic>> _transactions = transactionData;

  void _onSelectedSort(String type) {
    setState(() {
      _selectedType = type;
    });
  }

  List<Map<String, dynamic>> _filterTransactions() {
    if (_selectedType.isEmpty) return _transactions;

    return _transactions.where((transaction) {
      return transaction['type'] == _selectedType;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredTransactions = _filterTransactions();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            // User display
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF3BB44A),
                                Color(0xFFFF8D6C),
                                Color(0xFFE064F7),
                              ],
                              transform: const GradientRotation(pi / 4),
                            ),
                          ),
                        ),
                        Icon(
                          CupertinoIcons.person_fill,
                          color: AppColors.light,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Xin chào!",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          "Din",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),

            // Credit card display
            Container(
              width: AppDeviceUtils.getScreenWidth(context),
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF3BB44A),
                    Color(0xFFFF8D6C),
                    Color(0xFFE064F7),
                  ],
                  transform: const GradientRotation(pi / 4),
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: AppColors.darkGrey,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppTexts.homeTotal,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    AppTexts.homeTotalBalance,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Income(),
                        const SizedBox(
                          width: AppSizes.spaceBtwItems,
                        ),
                        Expense(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppTexts.total,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    popupMenuTheme: PopupMenuThemeData(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: PopupMenuButton<String>(
                      onSelected: _onSelectedSort,
                      icon: Row(
                        children: [
                          Text(
                            AppTexts.homeSort,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          value: 'Thu',
                          child: Text('Thu nhập'),
                        ),
                        PopupMenuItem(
                          value: 'Chi',
                          child: Text('Chi tiêu'),
                        ),
                        PopupMenuItem(
                          value: 'Nợ',
                          child: Text('Nợ'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),

            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: ListView.builder(
                  key: ValueKey(_selectedType),
                  itemCount: filteredTransactions.length,
                  itemBuilder: (context, int i) {
                    final transaction = filteredTransactions[i];
                    return Dismissible(
                      key: Key(transaction['name']),
                      onDismissed: (direction) {
                        setState(() {
                          _transactions.remove(transaction);
                        });
                      },
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.light,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: transaction['color'],
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        transaction['icon'],
                                      ],
                                    ),
                                  ),
                                  Text(
                                    transaction['name'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: AppSizes.spaceBtwItems,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      transaction['totalAmount'],
                                      style: TextStyle(
                                        fontSize: 13.89,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      transaction['date'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.darkGrey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      transaction['type'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: transaction['type'] == 'Chi'
                                            ? AppColors.error
                                            : transaction['type'] == 'Thu'
                                                ? AppColors.primary
                                                : AppColors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
