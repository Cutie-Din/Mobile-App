import 'package:budget_tracker/features/personalization/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../controllers/fund_controller.dart';
import '../models/fund.dart';
import 'main_screen.dart'; // Import MainScreen

class FundScreen extends StatefulWidget {
  final int ma_nguoi_dung;

  const FundScreen({
    super.key,
    required this.ma_nguoi_dung,
  });

  @override
  State<FundScreen> createState() => _FundScreenState();
}

class _FundScreenState extends State<FundScreen> {
  final FundController fundController = Get.put(FundController());

  @override
  Widget build(BuildContext context) {
    final fundsBox = Hive.box<Fund>('funds');

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 3,
                  ),
                ),
                alignment: Alignment.center,
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
                alignment: Alignment.topCenter,
                child: ValueListenableBuilder(
                  valueListenable: fundsBox.listenable(),
                  builder: (context, Box<Fund> box, _) {
                    final userFunds = box.values
                        .where((fund) =>
                            fund.ma_nguoi_dung == widget.ma_nguoi_dung)
                        .toList();

                    if (userFunds.isEmpty) {
                      return Center(
                        child: Text('Không có nguồn tiền!'),
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.all(16.0),
                      itemCount: userFunds.length,
                      itemBuilder: (context, index) {
                        final fund = userFunds[index];
                        final typef = fund.category;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Dismissible(
                            key: Key(fund.category + fund.amount.toString()),
                            onDismissed: (direction) {
                              fund.delete();
                            },
                            direction: DismissDirection.endToStart,
                            background: Container(
                              decoration: BoxDecoration(
                                color: AppColors.error,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Update the fund in the FundController
                                fundController.selectFund(fund);

                                // Show confirmation dialog
                                Get.dialog(
                                  AlertDialog(
                                    title: Text('Thông báo'),
                                    content: Text('Cập nhật ví thành công'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back(); // Close the dialog
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.primary,
                                    width: 3,
                                  ),
                                ),
                                child: ListTile(
                                  leading: FaIcon(
                                    IconData(fund.iconCode,
                                        fontFamily: 'FontAwesomeSolid'),
                                    color: AppColors.primary,
                                  ),
                                  title: Text(
                                    NumberFormat.currency(
                                            locale: 'vi_VN', symbol: '₫')
                                        .format(fund.amount),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    fund.category,
                                    style: TextStyle(
                                      color: fund.category == "Tiền mặt"
                                          ? AppColors.error
                                          : AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
