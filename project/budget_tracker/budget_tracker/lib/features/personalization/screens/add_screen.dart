import 'package:budget_tracker/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart'; // Import the intl package

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../controllers/fund_controller.dart';
import '../models/fund.dart';
import '../models/transaction.dart';
import 'widgets/Icons.dart';

import 'add_screen.dart';

class AddScreen extends StatefulWidget {
  final int ma_nguoi_dung;
  const AddScreen({
    super.key,
    required this.ma_nguoi_dung,
  });

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int? amount;
  String note = "Test";
  DateTime selectedDate = DateTime.now();
  String selectedWallet = "Chọn ví"; // Default value
  Fund? selectedFund;
  FundController fundController = Get.find<FundController>();

  List<String> months = [
    "Tháng 1",
    "Tháng 2",
    "Tháng 3",
    "Tháng 4",
    "Tháng 5",
    "Tháng 6",
    "Tháng 7",
    "Tháng 8",
    "Tháng 9",
    "Tháng 10",
    "Tháng 11",
    "Tháng 12",
  ];

  final NumberFormat currencyFormat = NumberFormat.decimalPattern();

  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024, 01),
      lastDate: DateTime(2100, 12),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      cancelText: "Huỷ",
      confirmText: "Xác nhận",
      helpText: "",
      locale: const Locale("vi"),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  bool isKhoanChiSelected = true;
  IconData selectedIcon = FontAwesomeIcons.magnifyingGlass;
  IconData wallet = FontAwesomeIcons.wallet;
  String selectedTitle = "Chọn nhóm";

  void _selectKhoanChi() {
    setState(() {
      isKhoanChiSelected = true;
    });
  }

  void _selectKhoanThu() {
    setState(() {
      isKhoanChiSelected = false;
    });
  }

  void _selectIcon() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Iconscreen(
          initialIcon: selectedIcon,
          initialTitle: selectedTitle,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedIcon = result['icon'];
        String category = result['category'];
        String title = result['title'];
        selectedTitle = "$category - $title";
      });
    }
  }

  Future<void> _saveTransaction() async {
    if (amount != null &&
        selectedTitle != "Chọn nhóm" &&
        selectedWallet != "Chọn ví" &&
        selectedFund != null) {
      final box = Hive.box<Transaction>('transactions');
      final transaction = Transaction(
        amount: amount!,
        date: selectedDate,
        note: note,
        category: selectedTitle,
        iconCode: selectedIcon.codePoint,
        ma_nguoi_dung: widget.ma_nguoi_dung,
      );

      // Prevent duplicate transactions
      final transactions = box.values.toList().cast<Transaction>();
      final isDuplicate = transactions.any((t) =>
          t.amount == amount &&
          t.note == note &&
          t.category == selectedTitle &&
          t.date == selectedDate &&
          t.ma_nguoi_dung == widget.ma_nguoi_dung);

      if (!isDuplicate) {
        await box.add(transaction);

        // Update the fund balance based on transaction type, passing the selected fund
        fundController.updateFundAmount(transaction, selectedFund!);

        // Clear the selected wallet after saving
        setState(() {
          selectedWallet = "Chọn ví";
          selectedFund = null;
        });
      } else {
        print("Duplicate transaction detected.");
      }
    } else {
      print("Lỗi: Vui lòng điền đầy đủ thông tin.");
    }
  }

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

  Future<void> _updateWalletMenuItems() async {
    final fundBox = Hive.box<Fund>('funds');
    List<Fund> funds = fundBox.values.toList();

    setState(() {
      _walletMenuItems = funds.map((fund) {
        return PopupMenuItem<Fund>(
          value: fund,
          child: Text(fund.category),
        );
      }).toList();
    });
  }

  List<PopupMenuEntry<Fund>> _walletMenuItems = [];

  void _onMenuItemSelected(Fund selectedFund) {
    setState(() {
      this.selectedFund = selectedFund;
      selectedWallet = selectedFund.category;
    });

    // Set the selected fund in FundController
    fundController.selectFund(selectedFund);
  }

  @override
  void initState() {
    super.initState();
    _updateWalletMenuItems(); // Load wallet menu items on initialization
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppBar(
          leading: IconButton(
            icon: FaIcon(FontAwesomeIcons.x),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Thêm giao dịch",
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
            GestureDetector(
              onTap: _selectIcon,
              child: Row(
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
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                      ),
                      constraints: BoxConstraints(
                        minHeight: 48,
                        maxHeight: 48,
                        minWidth: 150,
                        maxWidth: 200,
                      ),
                      child: Text(
                        selectedTitle,
                        style: TextStyle(
                          color: selectedTitle == "Chọn nhóm"
                              ? AppColors.black
                              : selectedTitle.startsWith("Chi")
                                  ? AppColors.error
                                  : AppColors.primary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            // Note input field
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.primary,
                  ),
                  padding: EdgeInsets.all(12.0),
                  child: FaIcon(
                    FontAwesomeIcons.pencil,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  width: AppSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Ghi chú",
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                    ),
                    onChanged: (val) {
                      note = val;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            // Date selector
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.primary,
                  ),
                  padding: EdgeInsets.all(12.0),
                  child: FaIcon(
                    wallet,
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
                          color: Colors.white,
                        ),
                      ),
                      child: SizedBox(
                        height: 51,
                        child: PopupMenuButton<Fund>(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          onSelected: _onMenuItemSelected,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedWallet != null
                                    ? selectedWallet
                                    : "Chọn ví",
                                style: TextStyle(
                                  color: AppColors.black,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          itemBuilder: (BuildContext context) {
                            return _walletMenuItems;
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
            // Select Date
            GestureDetector(
              onTap: () {
                _selectDate(context);
              },
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: EdgeInsets.all(12.0),
                    child: FaIcon(
                      FontAwesomeIcons.calendar,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(
                    width: AppSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                      ),
                      child: Text(
                        "${selectedDate.day} ${months[selectedDate.month - 1]}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await _saveTransaction();
                  Navigator.pop(context); // Close screen after saving
                },
                child: Text("Lưu"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
