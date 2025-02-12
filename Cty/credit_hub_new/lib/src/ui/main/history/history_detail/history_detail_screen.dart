import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:intl/intl.dart';

class HistoryDetailScreen extends StatelessWidget {
  const HistoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.button,
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: Text(
              'Chi tiết yêu cầu',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.black4,
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.chevronLeft,
            size: 12,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTransaction("Chờ quyết toán", "000392", "22/07/2021 07:20:11", "3.000.000"),
          const Gap(20),
          _buildImageTransaction(),
          const Gap(10),
          _buildProgressTransaction('Gửi yêu cầu quyết toán', '22/07/2021 07:20:11'),
          _buildProgressTransaction('Yêu cầu đang được xử lý', '22/07/2021 07:20:11'),
          _buildProgressTransactionDone('Từ chối quyết toán', '22/07/2021 07:20:11'),
          const Gap(30),
          AppButton(
            buttonText: "Yêu cầu lại",
            sizeButton: 'Medium',
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
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

  Widget _buildTransaction(
    String status,
    String id,
    String date,
    String money,
  ) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.historydetail.name);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTransactionLeftColumn(status),
                  _buildTransactionRightColumn(id, date, money),
                ],
              ),
            ),
          ),
          const Gap(10),
        ],
      ),
    );
  }

  Widget _buildTransactionLeftColumn(String status) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusBox(status),
          const Gap(8),
          _buildTransactionLabel("Ngày yêu cầu"),
          const Gap(11),
          _buildTransactionLabel("Số tiền"),
        ],
      ),
    );
  }

  Widget _buildStatusBox(String status) {
    return Container(
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
    );
  }

  Widget _buildTransactionLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: AppColors.grey3,
      ),
    );
  }

  Widget _buildTransactionRightColumn(String id, String date, String money) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Gap(8),
          Text(
            id,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: AppColors.black5,
            ),
          ),
          const Gap(8),
          Text(
            date,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColors.grey4,
            ),
          ),
          const Gap(11),
          _buildAmountRow(money),
        ],
      ),
    );
  }

  Widget _buildAmountRow(String money) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          money,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: AppColors.primary,
          ),
        ),
        const Icon(
          FontAwesomeIcons.dongSign,
          size: 14,
          color: AppColors.primary,
        ),
      ],
    );
  }

  Widget _buildImageTransaction() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align the text to the start
        children: [
          Text(
            'Hình ảnh hoá đơn',
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF535353),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 335,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://your-image-url.com'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFFE0E0E0), width: 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressTransaction(String text, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.progress,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.button,
                    width: 3,
                  ),
                ),
              ),
              // const Gap(4),
              Container(
                width: 4,
                height: 51,
                color: AppColors.progress,
              ),
            ],
          ),
          const Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black5,
                ),
              ),
              const Gap(2),
              Text(
                date,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressTransactionDone(String text, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.button,
                    width: 3,
                  ),
                ),
              ),
              // const Gap(4),
            ],
          ),
          const Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
              const Gap(2),
              Text(
                date,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
