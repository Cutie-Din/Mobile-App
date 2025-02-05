import 'package:credit_hub_new/src/utils/app_export.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
          clipBehavior: Clip.none,
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
        const Gap(55),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildChart(),
                const Gap(30),
                _buildRecent(),
              ],
            ),
          ),
        ),
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
              fontFamily: 'Public Sans',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: isLeft ? AppColors.primary : AppColors.secondary,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Public Sans',
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
    return StatefulBuilder(
      builder: (context, setState) {
        return Stack(
          children: <Widget>[
            const Center(
              child: Text(
                "Doanh số theo thời gian",
                style: TextStyle(
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 1.5,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 25,
                  left: 12,
                  top: 24,
                  bottom: 12,
                ),
                child: LineChart(
                  showAvg ? avgData() : mainData(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String format(double? value) {
    if (value == null) return '';
    return NumberFormat.decimalPattern('vi_VN').format(value);
  }

  LinearGradient getStatus(String? status) {
    if (status != null && status.contains("Chờ quyết toán")) {
      return AppColors.waiting;
    } else if (status != null && status.contains("Đã quyết toán")) {
      return AppColors.confirmed;
    } else if (status != null && status.contains("Không quyết toán")) {
      return AppColors.cancelled;
    } else {
      return AppColors.uploading;
    }
  }

  Widget _buildRecent() {
    return Column(
      children: [
        const Center(
          child: Text(
            "Yêu cầu gần đây",
            style: TextStyle(
              fontFamily: 'Public Sans',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        const Gap(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColors.button,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status Box
                      Container(
                        decoration: BoxDecoration(
                          gradient: AppColors.waiting,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            'Chờ quyết toán',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: AppColors.button,
                            ),
                          ),
                        ),
                      ),
                      const Gap(8),
                      // "Ngày yêu cầu" Text
                      const Text(
                        'Ngày yêu cầu',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.grey3,
                        ),
                      ),
                      const Gap(11),

                      // "Số tiền" Text
                      const Text(
                        'Số tiền',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.grey3,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Order ID
                      Gap(8),
                      Text(
                        '000392',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.black5,
                        ),
                      ),
                      Gap(8),
                      // Request Time
                      Text(
                        '22/07/2021 07:20:11',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.grey4,
                        ),
                      ),
                      // Amount
                      Gap(11),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '3.000.000',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: AppColors.primary,
                            ),
                          ),
                          Icon(
                            FontAwesomeIcons.dongSign,
                            size: 14,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
