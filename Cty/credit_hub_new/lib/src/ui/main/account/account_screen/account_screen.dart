import 'package:credit_hub_new/src/utils/app_export.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey8,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(AppImages.banner_account, fit: BoxFit.cover),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 190,
                child: Center(
                  child: _buildInfoBox('Đại lý DCV', 'DCV001'),
                ),
              ),
            ],
          ),
          const Gap(70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _buildComponent(
                  text: 'Thông tin cá nhân',
                  imagePath: AppImages.money_acc,
                  onTap: () {
                    Get.toNamed(AppRoute.accountdetails.name);
                  },
                ),
                const Gap(10),
                _buildComponent(
                  text: 'Tài khoản nhận tiền',
                  imagePath: AppImages.money_add,
                  onTap: () {
                    Get.toNamed(AppRoute.accountlist.name);
                  },
                ),
              ],
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String text1, String text2) {
    return Container(
      height: 114,
      width: 350,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF0F1F2), width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text1,
              style: GoogleFonts.roboto(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppColors.black5,
              ),
            ),
            Text(
              text2,
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.grey7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComponent({
    required String text,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
          height: 57,
          width: 350,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFF0F1F2), width: 0.5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 36,
                width: 44,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.grey8,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFF0F1F2), width: 0.5),
                ),
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
              const Gap(8),
              Expanded(
                child: Text(
                  text,
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Transform.rotate(
                  angle: 3.1416, // Xoay 180 độ
                  child: SvgPicture.asset(AppImages.back_icon),
                ),
              ),
            ],
          )),
    );
  }
}
