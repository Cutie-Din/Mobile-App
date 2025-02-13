import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:credit_hub_new/src/ui/main/history/cubit/history_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/history_state.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String selectedType = 'Tất cả';
  HistoryCubit get _cubit => Get.find<HistoryCubit>();

  final List<Map<String, String>> transactions = [
    {
      "status": "Chờ quyết toán",
      "id": "000392",
      "date": "22/07/2021 07:20:11",
      "amount": "3.000.000"
    },
    {
      "status": "Đã quyết toán",
      "id": "000393",
      "date": "23/07/2021 10:15:30",
      "amount": "5.000.000"
    },
    {
      "status": "Không quyết toán",
      "id": "000394",
      "date": "24/07/2021 14:05:45",
      "amount": "1.500.000"
    },
  ];

  List<Map<String, String>> get filteredTransactions {
    if (selectedType == 'Tất cả') return transactions;
    return transactions.where((t) => t['status'] == selectedType).toList();
  }

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    _cubit.postHistory(page_no: 1, page_size: 6);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          title: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Center(
              child: Text(
                'Lịch sử yêu cầu',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black4,
                ),
              ),
            ),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: SvgPicture.asset(
                  AppImages.filter_icon,
                  color: AppColors.primary,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return AppBottomSheet(
                        onClose: () => Navigator.of(context).pop(),
                        pickerType: 'AppDatePicker',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        body: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSearchBar(),
        const Gap(15),
        _buildTypeSelection(),
        const Gap(15),
        _buildTransactionList(),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF0F5FE),
          hintText: "Tìm kiếm",
          hintStyle: GoogleFonts.publicSans(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF8F96AD)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildTypeSelection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTypeBox('Tất cả'),
            const Gap(10),
            _buildTypeBox('Chờ quyết toán'),
            const Gap(10),
            _buildTypeBox('Không quyết toán'),
            const Gap(10),
            _buildTypeBox('Đã quyết toán'),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeBox(String status) {
    bool isSelected = status == selectedType;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedType = status;
        });
      },
      child: Container(
        height: 25,
        width: 94,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.button,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFF0F1F2), width: 0.5),
        ),
        child: Center(
          child: Text(
            status,
            style: GoogleFonts.publicSans(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: isSelected ? AppColors.button : AppColors.black5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return BlocBuilder<HistoryCubit, HistoryState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state.status == HistoryStatus.loading) {
          return const AppLoading();
        }

        if (state.status == HistoryStatus.failure) {
          return Center(
            child: Text(
              state.message ?? "Không thể tải dữ liệu",
              style: GoogleFonts.publicSans(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          );
        }

        final requests = state.data?.data ?? []; // ✅ Lấy danh sách yêu cầu từ DashboardModel

        if (requests.isEmpty) {
          return Center(
            child: Text(
              "Không có yêu cầu nào gần đây",
              style: GoogleFonts.publicSans(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          );
        }

        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              return _buildTransaction(
                request.status_name,
                request.id.toString(),
                request.date_request,
                request.money_request,
              );
            },
          ),
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

  Widget _buildTransaction(
    String status,
    String id,
    String date,
    num money,
  ) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.historydetail.name);
      },
      child: Column(
        children: [
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
}
