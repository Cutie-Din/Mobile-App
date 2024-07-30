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
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    MainScreen(),
    StatScreen(),
    FundScreen(),
    PersonalScreen(),
  ];

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
        index: _currentIndex,
        onChangedTab: _onChangedTab,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () => Get.to(() => const AddScreen()),
        shape: CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
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
          child: const Icon(
            CupertinoIcons.add,
            color: AppColors.light,
          ),
        ),
      ),

      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        children: pages,
      ),
    );
  }

  void _onChangedTab(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
