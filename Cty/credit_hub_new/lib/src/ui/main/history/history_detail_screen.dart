import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:credit_hub_new/src/ui/main/history/cubit/history_cubit.dart';
import 'package:credit_hub_new/src/ui/main/history/cubit/history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HistoryDetailScreen extends StatefulWidget {
  const HistoryDetailScreen({super.key});

  @override
  State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
  HistoryCubit get _cubit => Get.find<HistoryCubit>();

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;
    final transactionId = arguments?["id"];

    if (transactionId != null) {
      _cubit.getHistoryDetail(id: transactionId);
    }

    return BlocListener<HistoryCubit, HistoryState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state.status == HistoryStatus.loading) {
          AppLoading.show();
          return;
        }
        AppLoading.dismiss();
        if (state.status == HistoryStatus.failure) {
          AppDialog.show(context, msg: state.message);
          return;
        }
      },
      child: Scaffold(
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
              _cubit.postHistory(page_no: 1, page_size: 6);
              Get.back();
            },
          ),
        ),
        body: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: BlocBuilder<HistoryCubit, HistoryState>(
        bloc: _cubit,
        builder: (context, state) {
          final transaction = state.data_received!;
          final statusName = transaction.status_name ?? "N/A";

          return Column(
            children: [
              _buildTransaction(
                transaction.status_name ?? "N/A",
                transaction.lot_no,
                transaction.date_request ?? "N/A",
                transaction.money_request,
              ),
              const Gap(20),
              _buildImageTransaction(transaction.image_link),
              const Gap(10),
              _buildProgressTransaction(
                  'Gửi yêu cầu quyết toán', transaction.date_request ?? "N/A"),
              if (statusName != 'Chưa quyết toán')
                _buildProgressTransaction(
                    'Yêu cầu đang được xử lý', transaction.date_request ?? "N/A"),
              if (statusName == 'Chờ quyết toán' || statusName == 'Đã quyết toán')
                _buildProgressTransaction(
                    'Số tiền đang được xử lý', transaction.date_request ?? "N/A"),
              if (statusName == 'Chờ quyết toán')
                _buildProgressTransactionDone(
                    'Số tiền đang được xử lý', transaction.date_request ?? "N/A"),
              if (statusName == 'Đã quyết toán' || statusName == 'Không quyết toán')
                _buildProgressTransactionDone(
                  transaction.status_name ?? "N/A",
                  transaction.date_request ?? "N/A",
                ),
              if (statusName == 'Không quyết toán')
                Column(
                  children: [
                    const Gap(30),
                    AppButton(
                      buttonText: "Yêu cầu lại",
                      sizeButton: 'Medium',
                      onPressed: () {
                        _cubit.resendHistory(id: transaction.id!);
                        _cubit.postHistory(page_no: 1, page_size: 6);
                        Get.back();
                      },
                    ),
                  ],
                ),
            ],
          );
        },
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
    num money,
  ) {
    return Column(
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

  Widget _buildTransactionRightColumn(String id, String date, num money) {
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

  Widget _buildAmountRow(num money) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          NumberFormat("#,###").format(money),
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

  Widget _buildImageTransaction(String image_link) {
    if (image_link == null || !image_link.startsWith('http')) {
      return const Text("Không có ảnh");
    }
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
          if (image_link.isNotEmpty)
            Container(
              width: double.infinity,
              height: 335,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image_link), // Sử dụng ảnh từ API
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFE0E0E0), width: 1),
              ),
            )
          else
            Container(
              width: double.infinity,
              height: 335,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Placeholder khi không có ảnh
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFE0E0E0), width: 1),
              ),
              child: Center(
                child: Text(
                  'Không có hình ảnh',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
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
