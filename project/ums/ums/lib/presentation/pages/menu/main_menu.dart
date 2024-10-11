import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ums/core/constants/colors.dart';

import '../../../core/constants/device.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart';
import 'widgets/menu_item.dart';
import 'widgets/profile_header.dart';

class MainmenuScreen extends StatefulWidget {
  const MainmenuScreen({super.key});

  @override
  _MainmenuScreenState createState() => _MainmenuScreenState();
}

class _MainmenuScreenState extends State<MainmenuScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;

  // Định nghĩa menuItems như một biến instance
  final List<Map<String, dynamic>> menuItems = [
    {'icon': AppImg.profile, 'label': 'Thông tin cá nhân'},
    {'icon': AppImg.hssv, 'label': 'Hồ sơ sinh viên'},
    {'icon': AppImg.qtht, 'label': 'Quá trình học tập'},
    {'icon': AppImg.lock, 'label': 'In-Dev'},
    {'icon': AppImg.lock, 'label': 'In-Dev'},
    {'icon': AppImg.lock, 'label': 'In-Dev'},
    {'icon': AppImg.lock, 'label': 'In-Dev'},
    {'icon': AppImg.lock, 'label': 'In-Dev'},
    {'icon': AppImg.lock, 'label': 'In-Dev'},
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleLogout() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.scale,
      title: 'Đăng xuất',
      desc: 'Bạn có chắc chắn muốn đăng xuất?',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Navigator.pushReplacementNamed(context, '/sign-in');
      },
      btnOkText: 'Đồng ý',
      btnCancelText: 'Huỷ',
      btnOkColor: Colors.green,
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = AppDeviceUtils.screenHeight(context);
    final double screenWidth = AppDeviceUtils.screenWidth(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.main,
        body: Column(
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final double startOffset = screenHeight * 0.1;
                final double slideAnimationValue =
                    Curves.easeOut.transform(_animationController.value);

                return Transform.translate(
                  offset: Offset(0, -startOffset * (1 - slideAnimationValue)),
                  child: Opacity(
                    opacity: _animationController.value,
                    child: ProfileHeader(),
                  ),
                );
              },
            ),
            SizedBox(
              height: screenHeight * 0.135,
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(screenWidth * 0.05),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: screenWidth * 0.03,
                  mainAxisSpacing: screenWidth * 0.03,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      final double startOffset = screenHeight * 0.1;
                      final double slideAnimationValue =
                          Curves.easeOut.transform(_animationController.value);

                      return Transform.translate(
                        offset: Offset(0, startOffset * (1 - slideAnimationValue)),
                        child: Opacity(
                          opacity: _animationController.value,
                          child: GestureDetector(
                            onTap: () {
                              if (item['label'] == 'In-Dev') {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.scale,
                                  title: 'Ôi không!',
                                  desc: 'Hiện tại chức năng này đang được phát triển',
                                  btnOkOnPress: () {},
                                  btnOkText: 'Đồng ý',
                                  btnOkColor: AppColors.main,
                                ).show();
                              } else {
                                Navigator.pushNamed(context, '/${item['label']}');
                              }
                            },
                            child: MenuItem(
                              iconPath: item['icon'],
                              label: item['label'],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final double startOffset = screenHeight * 0.1;
                final double slideAnimationValue =
                    Curves.easeOut.transform(_animationController.value);

                return Transform.translate(
                  offset: Offset(0, startOffset * (1 - slideAnimationValue)),
                  child: Opacity(
                    opacity: _animationController.value,
                    child: GestureDetector(
                      onTap: _handleLogout,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        height: screenHeight * 0.07,
                        child: Center(
                          child: Text(
                            AppText.menu_logOut,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: screenWidth * 0.04,
                              fontWeight: AppFonts.bold,
                              color: AppColors.main,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
