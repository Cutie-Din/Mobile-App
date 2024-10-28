import 'package:finance/import.dart';
import 'widgets/banner.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: Column(
          children: [
            // Add the BannerDashBoard widget
            SizedBox(
              child: BannerDashBoard(),
            ),

            // Spacer for other dashboard content
            Expanded(
              child: Padding(
                padding: getResponsivePadding(context),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Other content for the dashboard
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
