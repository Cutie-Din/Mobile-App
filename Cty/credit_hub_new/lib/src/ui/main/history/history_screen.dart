import 'package:credit_hub_new/src/utils/app_export.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String selectedType = 'Tất cả';

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
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            controller: searchController,
            // onChanged: _onSearchChanged,
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
        ),
        const Gap(15),
        SingleChildScrollView(
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
        ),
        const Gap(15),
        Expanded(
          child: ListView.builder(
            itemCount: filteredTransactions.length,
            itemBuilder: (context, index) {
              final transaction = filteredTransactions[index];
              return _buildTransaction(
                transaction["status"]!,
                transaction["id"]!,
                transaction["date"]!,
                transaction["amount"]!,
              );
            },
          ),
        ),
      ],
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
    return Column(
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
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status Box
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
                      // "Ngày yêu cầu" Text
                      Text(
                        'Ngày yêu cầu',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.grey3,
                        ),
                      ),
                      const Gap(11),

                      // "Số tiền" Text
                      Text(
                        'Số tiền',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.grey3,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Order ID
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
                      // Request Time
                      Text(
                        date,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.grey4,
                        ),
                      ),
                      // Amount
                      const Gap(11),

                      Row(
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Gap(10),
      ],
    );
  }
}
