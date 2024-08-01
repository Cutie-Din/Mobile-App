// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/Icons.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int? amount;
  String note = "Test";
  DateTime selectedDate = DateTime.now();

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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024, 01),
        lastDate: DateTime(2100, 12),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        cancelText: "Huỷ",
        confirmText: "Xác nhận",
        helpText: "Chọn ngày",
        locale: const Locale("vi"));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  bool isKhoanChiSelected = true;
  IconData selectedIcon = FontAwesomeIcons.magnifyingGlass;
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
        selectedTitle = result['title'];
      });
    }
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
                    onChanged: (val) {
                      try {
                        amount = int.parse(val);
                      } catch (e) {}
                    },
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
                      child: Text(
                        selectedTitle,
                        style: TextStyle(
                          color: AppColors.black,
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

            /// Create Account
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Lưu"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
