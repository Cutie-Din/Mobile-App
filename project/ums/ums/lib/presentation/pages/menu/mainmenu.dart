import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ums/core/constants/colors.dart';

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

  @override
  void initState() {
    super.initState();

    // Single AnimationController for both ProfileHeader and bottom Container
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
      dialogType: DialogType.question, // No predefined header icon
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
    final List<Map<String, dynamic>> menuItems = [
      {'icon': AppImg.profile, 'label': 'Thông tin cá nhân'},
      {'icon': AppImg.lock, 'label': 'In-Dev'},
      {'icon': AppImg.lock, 'label': 'In-Dev'},
      {'icon': AppImg.lock, 'label': 'In-Dev'},
      {'icon': AppImg.lock, 'label': 'In-Dev'},
      {'icon': AppImg.lock, 'label': 'In-Dev'},
      {'icon': AppImg.lock, 'label': 'In-Dev'},
      {'icon': AppImg.lock, 'label': 'In-Dev'},
      {'icon': AppImg.settings, 'label': 'Cài đặt'},
    ];

    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: Column(
          children: [
            // Profile Header with slide down effect
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                const double startOffset = 100.0;
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
            const SizedBox(
              height: AppSizes.sm * 13,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20, // Space between columns
                  mainAxisSpacing: 20, // Space between rows
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      const double startOffset = 100.0;
                      final double slideAnimationValue =
                          Curves.easeOut.transform(_animationController.value);

                      return Transform.translate(
                        offset: Offset(0, startOffset * (1 - slideAnimationValue)),
                        child: Opacity(
                          opacity: _animationController.value,
                          child: GestureDetector(
                            onTap: () {
                              // Check the label to determine the action
                              if (item['label'] == 'In-Dev') {
                                // Show a dialog for "In-Dev" items
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error, // Không sử dụng header mặc định
                                  animType: AnimType.scale,
                                  // customHeader: ClipOval(
                                  //   child: Image.asset(
                                  //     AppImg.err,
                                  //     height: 200, // Phóng to kích thước GIF
                                  //     width: 200, // Đảm bảo kích thước đều để giữ hình tròn
                                  //     fit: BoxFit
                                  //         .cover, // Đảm bảo GIF lấp đầy không gian trong ClipOval
                                  //   ),
                                  // ),
                                  title: 'Ôi không!',
                                  desc: 'Hiện tại chức năng này đang được phát triển',
                                  btnOkOnPress: () {},
                                  btnOkText: 'Đồng ý',
                                  btnOkColor: AppColors.main,
                                ).show();
                              } else {
                                // Navigate to the new screen for other items
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

            // GestureDetector wrapping the bottom Container for logout functionality
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                const double startOffset = 100.0;
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
                        height: 50, // Adjust height as needed
                        child: Center(
                          child: Text(
                            AppText.menu_logOut, // Display "Logout" text
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: AppFonts.fontSizeMd,
                              fontWeight: AppFonts.bold,
                              color: AppColors.main, // Use your desired text color
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
