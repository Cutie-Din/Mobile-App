import 'dart:ffi';
import 'dart:math';

import 'package:budget_tracker/features/personalization/controllers/fund_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart'; // Import intl package

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../models/transaction.dart';
import 'widgets/Expense.dart';
import 'widgets/Income.dart';
import 'add_screen.dart';

class MainScreen extends StatefulWidget {
  final int ma_nguoi_dung;
  final String ten_nguoi_dung;

  const MainScreen({
    super.key,
    required this.ten_nguoi_dung,
    required this.ma_nguoi_dung,
  });

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late FundController fundController;

  @override
  void initState() {
    super.initState();
    fundController = Get.put(FundController());
    fundController.maNguoiDung = widget.ma_nguoi_dung;
    fundController.loadSelectedFundAmount();
    fundController.calculateTotalBalance();
  }

  String _selectedType = 'Tất cả'; // Default to 'Tất cả' to show all records

  void _onSelectedSort(String type) {
    setState(() {
      _selectedType = type;
    });
  }

  // Helper function to format the date
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'Hôm nay';
    } else if (difference == 1) {
      return 'Hôm qua';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  // Helper function to format the amount with commas
  String _formatAmount(int amount) {
    final format = NumberFormat.currency(locale: 'vi_VN', symbol: '');
    return format.format(amount);
  }

  @override
  Widget build(BuildContext context) {
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
                              transform: GradientRotation(pi / 4),
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
                          widget.ten_nguoi_dung,
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
              width: MediaQuery.of(context).size.width,
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
                    'Tổng số dư hiện tại',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Obx(
                    () {
                      final totalAmount = fundController.totalBalance.value;
                      return Text(
                        NumberFormat.currency(locale: 'vi_VN', symbol: '₫')
                            .format(totalAmount ??
                                0), // Display 0₫ if amount is null
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
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
                          value: 'Tất cả',
                          child: Text('Tất cả'),
                        ),
                        PopupMenuItem(
                          value: 'Chi',
                          child: Text('Khoản chi'),
                        ),
                        PopupMenuItem(
                          value: 'Thu',
                          child: Text('Khoản thu'),
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
              child: ValueListenableBuilder<Box<Transaction>>(
                valueListenable:
                    Hive.box<Transaction>('transactions').listenable(),
                builder: (context, box, _) {
                  final transactions = box.values
                      .toList()
                      .cast<Transaction>()
                      .where((transaction) =>
                          transaction.ma_nguoi_dung == widget.ma_nguoi_dung)
                      .toList();

                  final filteredTransactions = _selectedType == 'Tất cả'
                      ? transactions
                      : transactions.where((transaction) {
                          return transaction.category.contains(_selectedType);
                        }).toList();

                  if (filteredTransactions.isEmpty) {
                    return Center(
                      child: Text('Không có dữ liệu!'),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredTransactions.length,
                    itemBuilder: (context, index) {
                      final transaction = filteredTransactions[index];

                      final categoryName = transaction.category.split('-').last;
                      final type = transaction.category.split('-').first.trim();

                      // Assuming transaction.id is unique for each transaction
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10.0), // Space between items
                        child: Dismissible(
                          key: Key(transaction.ma_nguoi_dung
                              .toString()), // Use a unique key, e.g., transaction.id
                          onDismissed: (direction) {
                            transaction.delete();
                          },
                          direction: DismissDirection
                              .endToStart, // Restrict swipe to right-to-left
                          background: Container(
                            color: AppColors.error,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.light,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.primary,
                                width: 3,
                              ),
                            ),
                            child: Row(
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
                                          color: AppColors.primary,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      FaIcon(
                                        IconData(
                                          transaction.iconCode,
                                          fontFamily: 'FontAwesomeIcons',
                                          fontPackage: 'font_awesome_flutter',
                                        ),
                                        color: AppColors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        categoryName,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              '${_formatAmount(transaction.amount)}đ',
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
                                              _formatDate(transaction.date),
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
                                              type,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: type == "Thu"
                                                    ? AppColors.primary
                                                    : AppColors.error,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: AppSizes.spaceBtwItems,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
