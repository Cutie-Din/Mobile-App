import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:credit_hub_new/src/ui/main/account/cubit/account_cubit.dart';
import 'package:credit_hub_new/src/ui/main/account/cubit/account_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountListScreen extends StatefulWidget {
  const AccountListScreen({super.key});

  @override
  State<AccountListScreen> createState() => _AccountListScreenState();
}

class _AccountListScreenState extends State<AccountListScreen> {
  int? selectedIndex;
  int? swipedIndex;
  AccountCubit get _cubit => Get.find<AccountCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.postAccount(page_no: 1, page_size: 5);
  }

  @override
  Widget build(BuildContext context) {
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
      child: Scaffold(
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
    return BlocBuilder<AccountCubit, AccountState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state.status == AccountStatus.loading) {
          return const AppLoading();
        }

        if (state.status == AccountStatus.failure) {
          return Center(
            child: Text(
              state.message ?? "Không thể tải dữ liệu",
              style: GoogleFonts.publicSans(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          );
        }

        final bankAccounts = state.accounts ?? [];
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: bankAccounts.length,
          itemBuilder: (context, index) {
            final account = bankAccounts[index];

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = selectedIndex == index ? null : index;
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
                            _buildActionContainer(AppColors.grey3, AppImages.edit, () {
                              Get.toNamed(
                                AppRoute.accountedit.name,
                                arguments: {"id": account.id},
                              )?.then((_) {
                                _cubit.postAccount(page_no: 1, page_size: 5);
                              });
                            }),
                            const Gap(10),
                            _buildActionContainer(
                              AppColors.primary,
                              AppImages.rubbish,
                              () async {
                                await _cubit.deleteAccount(id: account.id!);
                                await _cubit.postAccount(page_no: 1, page_size: 5);
                              },
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
                    child: _buildAccountItem(
                      index,
                      account.bank_owner,
                      account.bank_no!,
                      account.bank_name,
                      account.bank_id,
                      account.icons,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildActionContainer(Color color, String icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
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

  Widget _buildAccountItem(
      int index, String bank_name, String bank_no, String bank_owner, int id, String icons) {
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
          _buildAccountIcon(icons),
          const Gap(10),
          Expanded(child: _buildAccountDetails(bank_name, bank_no, bank_owner, id)),
          if (selectedIndex == index) _buildSelectedIndicator(),
        ],
      ),
    );
  }

  Widget _buildAccountIcon(String icons) {
    if (icons == null || !icons.startsWith('http')) {
      return const Text("Không có ảnh");
    }
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD0D0D0), width: 2),
        image: DecorationImage(
          image: NetworkImage(icons),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildAccountDetails(String bank_name, String bank_no, String bank_owner, int id) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bank_name,
          style: GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.black5,
          ),
        ),
        Text(
          bank_no,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.black5,
          ),
        ),
        Text(
          bank_owner,
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
