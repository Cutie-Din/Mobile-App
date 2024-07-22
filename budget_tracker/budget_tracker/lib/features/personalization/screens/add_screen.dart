// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:budget_tracker/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  List<String> myIcon = [
    AppImages.entertainment,
    AppImages.food,
    AppImages.home,
    AppImages.pet,
    AppImages.shopping,
    AppImages.travel,
    AppImages.tech
  ];

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: AppBar(
          backgroundColor: AppColors.primaryBackground,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppTexts.adding,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              SizedBox(
                width: AppHelperFunctions.screenWidth() * 0.7,
                child: TextFormField(
                  controller: expenseController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    suffixIcon: Icon(
                      FontAwesomeIcons.dongSign,
                      size: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              TextFormField(
                controller: categoryController,
                textAlignVertical: TextAlignVertical.center,
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  prefixIcon: const Icon(
                    FontAwesomeIcons.list,
                    size: 16,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          bool isExpended = false;
                          String selectedIcon = '';
                          Color pickedColor = AppColors.light;
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AlertDialog(
                                title: const Text(
                                  'Tạo danh mục',
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        filled: true,
                                        isDense: true,
                                        fillColor: AppColors.light,
                                        hintText: 'Chi phí',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppSizes.spaceBtwItems,
                                    ),
                                    TextFormField(
                                      onTap: () {
                                        setState(() {
                                          isExpended = !isExpended;
                                        });
                                      },
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        isDense: true,
                                        suffixIcon: Icon(
                                          CupertinoIcons.chevron_down,
                                          size: 12,
                                        ),
                                        fillColor: AppColors.light,
                                        hintText: 'Biểu tượng',
                                        border: OutlineInputBorder(
                                          borderRadius: isExpended
                                              ? const BorderRadius.vertical(
                                                  top: Radius.circular(12),
                                                )
                                              : BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                    isExpended
                                        ? Container(
                                            width: AppHelperFunctions
                                                .screenWidth(),
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: AppColors.light,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                bottom: Radius.circular(12),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GridView.builder(
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  mainAxisSpacing: 5,
                                                  crossAxisSpacing: 5,
                                                ),
                                                itemCount: myIcon.length,
                                                itemBuilder: (context, int i) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIcon =
                                                            myIcon[i];
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 3,
                                                          color: selectedIcon ==
                                                                  myIcon[i]
                                                              ? AppColors
                                                                  .success
                                                              : AppColors.black,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              myIcon[i]),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    const SizedBox(
                                      height: AppSizes.spaceBtwItems,
                                    ),
                                    TextFormField(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (ctx2) {
                                              return AlertDialog(
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    BlockPicker(
                                                      pickerColor:
                                                          AppColors.primary,
                                                      onColorChanged: (value) {
                                                        setState(() {
                                                          pickedColor = value;
                                                        });
                                                      },
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      height: 50,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(ctx2);
                                                        },
                                                        style: TextButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              AppColors.primary,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "Lưu",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        isDense: true,
                                        fillColor: pickedColor,
                                        hintText: 'Màu',
                                        hintStyle: TextStyle(
                                            color: pickedColor == pickedColor
                                                ? AppColors.black
                                                : AppColors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppSizes.spaceBtwItems,
                                    ),
                                    TextFormField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColors.light,
                                        hintText: 'Loại',
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppSizes.spaceBtwItems,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: kToolbarHeight,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Text(
                                          "Lưu",
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      FontAwesomeIcons.plus,
                      size: 14,
                    ),
                  ),
                  hintText: AppTexts.labelAdding,
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    helpText: '',
                    cancelText: 'Huỷ',
                    confirmText: 'Ok',
                    errorFormatText: 'Sai định dạng ngày',
                    errorInvalidText: 'Ngày không hợp lệ',
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      Duration(days: 365),
                    ),
                  );
                  if (newDate != null) {
                    setState(
                      () {
                        dateController.text =
                            DateFormat('dd/MM/yyyy').format(newDate);
                        selectDate = newDate;
                      },
                    );
                  }
                },
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  prefixIcon: Icon(
                    FontAwesomeIcons.clock,
                    size: 16,
                  ),
                  hintText: AppTexts.dateAdding,
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Lưu",
                    style: TextStyle(color: AppColors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
