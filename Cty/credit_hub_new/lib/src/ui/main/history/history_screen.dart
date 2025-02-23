import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:credit_hub_new/src/ui/main/history/cubit/history_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'cubit/history_state.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String selectedType = 'Tất cả';
  HistoryCubit get _cubit => Get.find<HistoryCubit>();
  TextEditingController searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  int pageNo = 1;
  int pageSize = 6;
  List<RequestHistory> requests = [];

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

  Future<void> _fetchData() async {
    await _cubit.postHistory(page_no: pageNo, page_size: pageSize);
  }

  Future<void> _loadMore() async {
    if (_cubit.state.status == HistoryStatus.loading) return;
    pageNo++;
    await _fetchData();
  }

  @override
  void initState() {
    super.initState();
    _fetchData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
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
        if (state.status == HistoryStatus.success) {
          setState(() {
            if (pageNo == 1) {
              requests = List.from(state.data);
            } else {
              requests = List.from(requests)..addAll(state.data);
            }
          });
        }
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
        onChanged: (value) {
          if (value.isNotEmpty) {
            _cubit.searchHistory(lot_no: value);
          } else {
            _cubit.postHistory(page_no: pageNo, page_size: pageSize);
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF0F5FE),
          hintText: "Nhập số lô để tìm kiếm",
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
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: requests.length + 1,
        itemBuilder: (context, index) {
          if (index == requests.length) {
            return _cubit.state.status == HistoryStatus.loading
                ? const AppLoading()
                : const SizedBox();
          }

          final request = requests[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(
                  AppRoute.historydetail.name,
                  arguments: {"id": request.id},
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: AppColors.button,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRequestDetails(request.status_name),
                    _buildRequestValues(
                      request.lot_no,
                      request.date_request,
                      request.money_request,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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

  Widget _buildRequestValues(String lot_no, String date, num money) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Gap(8),
          Text(
            lot_no,
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
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: AppColors.black5,
            ),
          ),
          const Gap(11),
          Row(
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
              const Icon(FontAwesomeIcons.dongSign, size: 14, color: AppColors.primary),
            ],
          ),
        ],
      ),
    );
  }
}
