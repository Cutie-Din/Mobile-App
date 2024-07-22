// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:budget_tracker/features/personalization/screens/add_screen.dart';
import 'package:budget_tracker/features/personalization/screens/fund_screen.dart';
import 'package:budget_tracker/features/personalization/screens/main_screen.dart';
import 'package:budget_tracker/features/authentication/screens/logout/personal_screen.dart';
import 'package:budget_tracker/features/personalization/screens/widgets/TabItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import 'stat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = <Widget>[
    AddScreen(),
    StatScreen(),
    FundScreen(),
    PersonalScreen(),
  ];

  int index = 0;
  late Color selectedItem = AppColors.primary;
  Color unselectedItem = AppColors.darkerGrey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,

      extendBody: true,

      /// App Bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),

      bottomNavigationBar: Tabitem(
        index: index,
        onChangedTab: onChangedTab,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddScreen()),
        shape: CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFFFF8D6C),
                Color(0xFFE064F7),
                Color(0xFF00B2E7),
              ],
              transform: const GradientRotation(pi / 4),
            ),
          ),
          child: const Icon(
            CupertinoIcons.add,
            color: AppColors.light,
          ),
        ),
      ),
      body: index == 0
          ? MainScreen()
          : index == 1
              ? StatScreen()
              : index == 2
                  ? FundScreen()
                  : PersonalScreen(),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
