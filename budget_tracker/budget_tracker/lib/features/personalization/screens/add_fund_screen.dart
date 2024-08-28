import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../models/fund.dart';
import 'widgets/Icons.dart';

class AddFundScreen extends StatefulWidget {
  final int ma_nguoi_dung;
  const AddFundScreen({super.key, required this.ma_nguoi_dung});

  @override
  State<AddFundScreen> createState() => _AddFundScreenState();
}

class _AddFundScreenState extends State<AddFundScreen> {
  int? amount;
  bool _isSnackBarVisible = false; // Flag to track SnackBar visibility

  final NumberFormat currencyFormat = NumberFormat.decimalPattern();

  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  IconData selectedIcon = FontAwesomeIcons.magnifyingGlass;
  String selectedTitle = "Chọn nhóm";

  void _onAmountChanged(String value) {
    // Remove any non-digit characters and parse the input
    String digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');
    if (digitsOnly.isNotEmpty) {
      amount = int.tryParse(digitsOnly);
    } else {
      amount = null;
    }

    // Format the number with commas
    String formatted = currencyFormat.format(amount ?? 0);

    // Update the text field with the formatted number
    _amountController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  Future<void> _saveFund() async {
    if (amount != null && selectedTitle != "Chọn nhóm") {
      final box = Hive.box<Fund>('funds');
      final fund = Fund(
        amount: amount!,
        category: selectedTitle,
        iconCode: selectedIcon.codePoint,
        ma_nguoi_dung: widget.ma_nguoi_dung,
      );

      // Prevent duplicate Funds
      final funds = box.values.toList().cast<Fund>();
      final isDuplicate = funds.any((f) =>
          f.category == selectedTitle &&
          f.ma_nguoi_dung == widget.ma_nguoi_dung);

      if (!isDuplicate) {
        await box.add(fund);
        Navigator.pop(context); // Close screen after saving
      } else {
        // Show SnackBar for duplicate fund
        await _showSnackBar("Ví đã tồn tại");
      }
    } else {
      // Show SnackBar for incomplete information
      await _showSnackBar("Vui lòng điền đầy đủ thông tin.");
    }
  }

  Future<void> _showSnackBar(String message) async {
    setState(() {
      _isSnackBarVisible = true;
    });

    await ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        )
        .closed;

    setState(() {
      _isSnackBarVisible = false;
    });
  }

  void _onMenuItemSelected(String value) {
    setState(() {
      selectedTitle = value;
      selectedIcon = value == "Tiền mặt"
          ? FontAwesomeIcons.wallet
          : FontAwesomeIcons.university;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.x),
          onPressed: _isSnackBarVisible
              ? null
              : () {
                  Navigator.pop(context);
                },
        ),
        title: Text(
          "Thêm nguồn tiền",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        backgroundColor: AppColors.grey,
      ),
      body: ListView(
        padding: EdgeInsets.all(12.0),
        children: [
          const SizedBox(
            height: AppSizes.spaceBtwSections,
          ),
          // Amount input field
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primary,
                ),
                padding: EdgeInsets.all(12.0),
                child: FaIcon(
                  FontAwesomeIcons.moneyBill1Wave,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                width: AppSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    hintText: "0",
                    filled: true,
                    fillColor: AppColors.white,
                    suffix: FaIcon(FontAwesomeIcons.dongSign),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                  ),
                  onChanged: _onAmountChanged,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          // Icon and title selector
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primary,
                ),
                padding: EdgeInsets.all(12.0),
                child: FaIcon(
                  selectedIcon,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                width: AppSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.primary,
                    ),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      popupMenuTheme: PopupMenuThemeData(
                        color: Colors
                            .white, // Set the popup menu background color to white
                      ),
                    ),
                    child: SizedBox(
                      height: 51,
                      child: PopupMenuButton<String>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onSelected: _onMenuItemSelected,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedTitle,
                              style: TextStyle(
                                color: selectedTitle == "Tiền mặt"
                                    ? AppColors.error
                                    : selectedTitle == "Ngân hàng"
                                        ? AppColors.primary
                                        : AppColors.black,
                              ),
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem<String>(
                              value: "Tiền mặt",
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Tiền mặt",
                                  style: TextStyle(
                                    color: AppColors.error,
                                    fontSize: 14, // Adjust font size here
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Ngân hàng",
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Ngân hàng",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 14, // Adjust font size here
                                  ),
                                ),
                              ),
                            ),
                          ];
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          // Save button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _saveFund,
              child: Text("Lưu"),
            ),
          ),
        ],
      ),
    );
  }
}
