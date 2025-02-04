import 'package:credit_hub_new/src/utils/app_export.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Color> gradientColors = [
    Color(0x33FF4A4A),
    AppColors.button,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none, // Đảm bảo không cắt nội dung bị tràn
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(AppImages.banner_dashboard, fit: BoxFit.cover),
            ),
            Positioned(
              right: 30,
              bottom: 65,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to',
                        style: TextStyle(
                          fontFamily: 'PublicSans',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.button,
                        ),
                      ),
                      Text(
                        'CreditHub',
                        style: TextStyle(
                          fontFamily: 'PublicSans',
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: AppColors.button,
                        ),
                      ),
                      Gap(15),
                    ],
                  ),
                  const Gap(25),
                  SizedBox(
                    width: 150,
                    child: Image.asset(AppImages.pos_dashboard),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 240,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildInfoBox('70', 'Yêu cầu chờ quyết toán', isLeft: true),
                      const Gap(20),
                      _buildInfoBox('300.000.000', 'Số tiền chờ quyết toán', isLeft: false),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        _buildChart(),
      ],
    );
  }

  Widget _buildInfoBox(String number, String text, {required bool isLeft}) {
    return Container(
      width: 158,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF0F1F2), width: 0.5),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFE6F1FF),
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: TextStyle(
              fontFamily: 'PublicSans',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: isLeft ? AppColors.primary : AppColors.secondary,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'PublicSans',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grey1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return const Column(
      children: [
        Gap(53),
        Center(
          child: Text(
            "Doanh số theo thời gian",
            style: TextStyle(
              fontFamily: 'PublicSans',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.grey2,
            ),
          ),
        ),
      ],
    );
  }
}
