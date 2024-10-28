import 'package:flutter/material.dart';
import 'package:finance/import.dart';
import 'widgets/banner.dart';
import 'widgets/rec.dart';
import 'widgets/chart.dart';
import 'widgets/recent.dart'; // Ensure this points to your RecentDashBoard widget file

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: Column(
          children: [
            const BannerDashBoard(), // Keep the banner at the top

            const RecDashBoard(), // RecDashBoard below the banner

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    SizedBox(height: 20), // Space between RecDashBoard and ChartDashBoard
                    ChartDashBoard(), // Adding ChartDashBoard here
                    SizedBox(height: 20), // Space between ChartDashBoard and RecentDashBoard
                    RecentDashBoard(), // Adding RecentDashBoard here
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
