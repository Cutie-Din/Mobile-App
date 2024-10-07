import 'package:flutter/material.dart';
import 'package:ums/core/constants/colors.dart';

import '../../../core/constants/fonts.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart';
import 'widgets/logout_btn.dart';
import 'widgets/menu_item.dart';
import 'widgets/profile_header.dart';

class MainmenuScreen extends StatelessWidget {
  const MainmenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeader(), // Profile section
            const SizedBox(
              height: AppSizes.sm * 2,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.all(20),
                children: const [
                  MenuItem(icon: Icons.person, label: 'Thông tin cá nhân'),
                  MenuItem(icon: Icons.developer_mode, label: 'In-Dev'),
                  MenuItem(icon: Icons.developer_mode, label: 'In-Dev'),
                  MenuItem(icon: Icons.developer_mode, label: 'In-Dev'),
                  MenuItem(icon: Icons.developer_mode, label: 'In-Dev'),
                  MenuItem(icon: Icons.developer_mode, label: 'In-Dev'),
                  MenuItem(icon: Icons.developer_mode, label: 'In-Dev'),
                  MenuItem(icon: Icons.developer_mode, label: 'In-Dev'),
                  MenuItem(icon: Icons.developer_mode, label: 'In-Dev'),
                  MenuItem(icon: Icons.developer_mode, label: 'In-Dev'),
                ],
              ),
            ),
            LogoutButton(), // Logout section
          ],
        ),
      ),
    );
  }
}
