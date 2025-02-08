import 'package:credit_hub_new/src/utils/app_export.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool showAvg = false;
  late ScrollController _scrollController;
  double _opacity = 1.0;

  final List<Map<String, String>> recentRequests = [
    {
      "status": "Đã quyết toán",
      "id": "000392",
      "date": "22/07/2021 07:20:11",
      "money": "3.000.000"
    },
    {
      "status": "Chờ quyết toán",
      "id": "000392",
      "date": "22/07/2021 07:20:11",
      "money": "3.000.000"
    },
    {
      "status": "Không quyết toán",
      "id": "000392",
      "date": "22/07/2021 07:20:11",
      "money": "3.000.000"
    },
    {
      "status": "Đã quyết toán",
      "id": "000392",
      "date": "22/07/2021 07:20:11",
      "money": "3.000.000"
    },
    {
      "status": "Chờ quyết toán",
      "id": "000392",
      "date": "22/07/2021 07:20:11",
      "money": "3.000.000"
    },
  ];

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

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        double newOpacity = 1.0 - (_scrollController.offset / 200).clamp(0.0, 1.0);
        setState(() {
          _opacity = newOpacity;
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        Column(
          children: [
            _buildBanner(),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const Gap(45),
                    _buildChartSection(),
                    const Gap(30),
                    _buildRecentRequests(),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 240,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 0),
            opacity: _opacity,
            child: _buildStats(),
          ),
        ),
      ],
    );
  }

  Widget _buildBanner() {
    return Stack(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to',
                    style: GoogleFonts.publicSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.button,
                    ),
                  ),
                  Text(
                    'CreditHub',
                    style: GoogleFonts.publicSans(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: AppColors.button,
                    ),
                  ),
                  const Gap(15),
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
      ],
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildInfoBox('70', 'Yêu cầu chờ quyết toán', isLeft: true),
        const Gap(20),
        _buildInfoBox('300.000.000', 'Số tiền chờ quyết toán', isLeft: false),
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
            style: GoogleFonts.publicSans(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: isLeft ? AppColors.primary : AppColors.secondary,
            ),
          ),
          Text(
            text,
            style: GoogleFonts.publicSans(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grey1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection() {
    return Column(
      children: [
        Center(
          child: Text(
            "Doanh số theo thời gian",
            style: GoogleFonts.publicSans(
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
  }

  Widget _buildRecentRequests() {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoute.historydetail.name),
      child: Column(
        children: [
          Center(
            child: Text(
              "Yêu cầu gần đây",
              style: GoogleFonts.publicSans(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recentRequests.length,
            itemBuilder: (context, index) {
              final request = recentRequests[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 4.0), // Giảm khoảng cách giữa các item
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
                      _buildRequestDetails(request["status"]!),
                      _buildRequestValues(request["id"]!, request["date"]!, request["money"]!),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRequestDetails(String status) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: getStatus(status),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                status,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: AppColors.button,
                ),
              ),
            ),
          ),
          const Gap(8),
          Text(
            'Ngày yêu cầu',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.grey3),
          ),
          const Gap(11),
          Text(
            'Số tiền',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.grey3),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestValues(String id, String date, String money) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Gap(8),
          Text(
            id,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.black5),
          ),
          const Gap(8),
          Text(
            date,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.black5),
          ),
          const Gap(11),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                money,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, fontSize: 15, color: AppColors.primary),
              ),
              const Icon(FontAwesomeIcons.dongSign, size: 14, color: AppColors.primary),
            ],
          ),
        ],
      ),
    );
  }
}
