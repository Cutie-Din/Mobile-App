import 'package:credit_hub_new/src/shared/app_export.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.button,
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: Text(
              'Thông tin cá nhân',
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 700),
          child: AppButton(
            buttonText: 'Đăng xuất',
            sizeButton: 'medium',
            onPressed: () => Get.offAllNamed(AppRoute.signIn.name),
          ),
        )
      ],
    );
  }
}
