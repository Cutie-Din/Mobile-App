part of 'app_bottom_sheet.dart';

class AppBankPicker extends StatefulWidget {
  final VoidCallback onClose;

  const AppBankPicker({super.key, required this.onClose});

  @override
  State<AppBankPicker> createState() => _AppBankPickerState();
}

class _AppBankPickerState extends State<AppBankPicker> {
  AccountCubit get _cubit => Get.find<AccountCubit>();
  TextEditingController searchController = TextEditingController();
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    _cubit.getDropdowbank();
    return BlocListener<AccountCubit, AccountState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state.status == AccountStatus.loading) {
          AppLoading.show();
          return;
        }
        AppLoading.dismiss();

        if (state.status == AccountStatus.failure) {
          AppDialog.show(context, msg: state.message);
          return;
        }
      },
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                size: 25,
                color: AppColors.grey7,
              ),
              onPressed: () {
                widget.onClose();
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
          ),
          const Gap(20),
          Expanded(child: _bankPicker()),
        ],
      ),
    );
  }

  Widget _bankPicker() {
    return BlocBuilder<AccountCubit, AccountState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state.status == AccountStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.dropdownbank.isEmpty) {
          return const Center(child: Text("Không có ngân hàng nào"));
        }

        return ListView.builder(
          itemCount: state.dropdownbank.length,
          itemBuilder: (context, index) {
            final bank = state.dropdownbank[index];
            bool isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  Navigator.pop(context, {'id': bank.id, 'name': bank.name});
                });
              },
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFD0D0D0), width: 2),
                        image: DecorationImage(
                          image: NetworkImage(bank.avatar),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bank.name,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            bank.description,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
                          ),
                          const Gap(5),
                          const Divider(color: Colors.grey, thickness: 1),
                        ],
                      ),
                    ),
                    if (isSelected) const Icon(Icons.check_circle, color: Colors.blue, size: 24),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
