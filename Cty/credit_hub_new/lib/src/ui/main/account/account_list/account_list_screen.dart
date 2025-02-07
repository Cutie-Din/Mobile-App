import 'package:credit_hub_new/src/utils/app_export.dart';

class AccountListScreen extends StatefulWidget {
  const AccountListScreen({super.key});

  @override
  State<AccountListScreen> createState() => _AccountListScreenState();
}

class _AccountListScreenState extends State<AccountListScreen> {
  int? selectedIndex;
  int? swipedIndex;

  final List<Map<String, String>> accounts = [
    {"name": "Nguyễn Văn A", "bank": "Vietcombank", "code": "12345678"},
    {"name": "Trần Thị B", "bank": "Techcombank", "code": "87654321"},
    {"name": "Phạm Văn C", "bank": "BIDV", "code": "11223344"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.button,
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: Text(
              'Danh sách tài khoản',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.black4,
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.chevronLeft, size: 12),
          onPressed: () => Get.back(),
        ),
      ),
      body: _buildContent(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => Get.toNamed(AppRoute.accountadd.name),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildContent() {
    return GestureDetector(
      onTap: () {
        setState(() {
          swipedIndex = null;
        });
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: _bankAccountList(),
      ),
    );
  }

  Widget _bankAccountList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        final account = accounts[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = selectedIndex == index ? null : index; // Toggle chọn
            });
          },
          onHorizontalDragUpdate: (details) {
            setState(() {
              if (details.primaryDelta! < -5) {
                swipedIndex = index;
              } else if (details.primaryDelta! > 5) {
                swipedIndex = null;
              }
            });
          },
          child: Stack(
            children: [
              // Swipe Actions
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildActionContainer(
                            AppColors.grey3,
                            AppImages.edit,
                            () => Get.toNamed(
                                  AppRoute.accountedit.name,
                                )),
                        const Gap(10),
                        _buildActionContainer(
                          AppColors.primary,
                          AppImages.rubbish,
                          () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Nội dung tài khoản
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                transform: Matrix4.translationValues(swipedIndex == index ? -130 : 0, 0, 0),
                child: _buildAccountItem(account, index),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionContainer(Color color, String icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Bắt sự kiện khi nhấn vào nút
      child: Container(
        width: 55,
        height: 65,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Image.asset(
            icon,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildAccountItem(Map<String, String> account, int index) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.button,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        children: [
          _buildAccountIcon(),
          const Gap(10),
          Expanded(child: _buildAccountDetails(account)),

          // Hiển thị check_circle khi tài khoản được chọn
          if (selectedIndex == index) _buildSelectedIndicator(),
        ],
      ),
    );
  }

  Widget _buildAccountIcon() {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD0D0D0), width: 2),
        image: DecorationImage(
          image: AssetImage(AppImages.money_add),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildAccountDetails(Map<String, String> account) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          account["name"]!,
          style: GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.black5,
          ),
        ),
        Text(
          account["bank"]!,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.black5,
          ),
        ),
        Text(
          account["code"]!,
          style: const TextStyle(fontSize: 14, color: Color(0xFF7B7B7B)),
        ),
      ],
    );
  }

  Widget _buildSelectedIndicator() {
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.check_circle, color: Colors.green, size: 24),
    );
  }
}
