import 'dart:math';

import 'package:budget_tracker/features/personalization/screens/add_screen.dart';
import 'package:budget_tracker/features/personalization/screens/fund_screen.dart';
import 'package:budget_tracker/features/personalization/screens/main_screen.dart';
import 'package:budget_tracker/features/authentication/screens/logout/personal_screen.dart';
import 'package:budget_tracker/features/personalization/screens/widgets/TabItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../utils/constants/colors.dart';
import '../models/fund.dart';
import 'add_fund_screen.dart';
import 'stat_screen.dart';

class HomeScreen extends StatefulWidget {
  final int ma_nguoi_dung;
  final String ten_nguoi_dung;

  const HomeScreen({
    super.key,
    required this.ten_nguoi_dung,
    required this.ma_nguoi_dung,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<Widget> pages;

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);

    // Initialize pages with the username passed to HomeScreen
    pages = [
      MainScreen(
        ma_nguoi_dung: widget.ma_nguoi_dung,
        ten_nguoi_dung: widget.ten_nguoi_dung,
      ), // Pass username here
      StatScreen(),
      FundScreen(
        ma_nguoi_dung: widget.ma_nguoi_dung,
      ),
      PersonalScreen(),
    ];
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
        onPressed: _handleFloatingActionButtonPress,
        shape: CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: const <Color>[
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

  void _handleFloatingActionButtonPress() async {
    // Check if the 'funds' box is already open to avoid opening it multiple times
    var fundBox;
    if (!Hive.isBoxOpen('funds')) {
      fundBox = await Hive.openBox<Fund>('funds');
    } else {
      fundBox = Hive.box<Fund>('funds');
    }

    if (_currentIndex == 2) {
      // Directly navigate to AddFundScreen if on FundScreen
      Get.to(() => AddFundScreen(ma_nguoi_dung: widget.ma_nguoi_dung));
    } else {
      // For MainScreen or StatScreen, check if there are any funds
      if (fundBox.isEmpty) {
        // Show a dialog if no funds are available
        _showNoFundsDialog();
      } else {
        // Navigate to AddScreen if funds are present
        Get.to(() => AddScreen(ma_nguoi_dung: widget.ma_nguoi_dung));
      }
    }
  }

  void _showNoFundsDialog() {
    // Show an alert dialog to inform the user
    Get.dialog(
      AlertDialog(
        title: Text('Thông báo'),
        content: Text('Vui lòng thêm quỹ/ví để có thể thêm giao dịch'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text('Xác nhận'),
          ),
        ],
      ),
    );
  }
}
