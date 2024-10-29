import 'package:finance/import.dart';
import 'widgets/banner.dart';
import 'widgets/rec.dart';
import 'widgets/chart.dart';
import 'widgets/recent.dart'; // Ensure this points to your RecentDashBoard widget file

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        // Use Stack to allow overlapping widgets
        children: const [
          Column(
            children: [
              BannerDashBoard(), // Keep the banner at the top
              SizedBox(height: 50), // Space before the ChartDashBoard
              SizedBox(
                height: 400, // Fixed height for ChartDashBoard
                child: ChartDashBoard(), // ChartDashBoard without scrolling
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200, // Fixed height for RecentDashBoard
                        child: SingleChildScrollView(
                          child: RecentDashBoard(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 190, // Adjust this value to move RecDashBoard up/down
            left: 0,
            right: 0,
            child: RecDashBoard(), // RecDashBoard over both the banner and Expanded
          ),
        ],
      ),
    );
  }
}
