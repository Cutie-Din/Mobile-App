// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:budget_tracker/features/authentication/controller/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  LogoutController logoutController = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40, // Adjust height as needed
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 3,
                  ),
                ),
                alignment: Alignment.center, // Center align the text
                child: Text(
                  "Tài khoản",
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
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 3,
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Cài đặt'),
                      onTap: () {
                        // Add your settings action here
                      },
                    ),
                    Divider(
                      height: AppSizes.spaceBtwInputFields,
                      color: AppColors.primary,
                    ),
                    ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text('Giới thiệu'),
                      onTap: () {
                        // Add your about action here
                      },
                    ),
                    Divider(
                      height: AppSizes.spaceBtwInputFields,
                      color: AppColors.primary,
                    ),
                    ListTile(
                      leading: Icon(Icons.support_agent),
                      title: Text('Hỗ trợ'),
                      onTap: () {
                        // Add your support action here
                      },
                    ),
                    Divider(
                      height: AppSizes.spaceBtwInputFields,
                      color: AppColors.primary,
                    ),
                    ListTile(
                      leading: Icon(Icons.logout_outlined),
                      title: Text('Đăng xuất'),
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (ctx) {
                            return AlertDialog(
                              title: Text('Bạn có chắc chắn muốn đăng xuất?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                    Get.find<LogoutController>().logout();
                                  },
                                  child: Text('Đồng ý'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text('Huỷ'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
