import 'package:credit_hub_new/src/components/bottomsheet/app_bottom_sheet.dart';
import 'package:credit_hub_new/src/utils/app_export.dart';

class AccountAddScreen extends StatefulWidget {
  const AccountAddScreen({super.key});

  @override
  State<AccountAddScreen> createState() => _AccountAddScreenState();
}

class _AccountAddScreenState extends State<AccountAddScreen> {
  final TextEditingController _numAccController = TextEditingController();
  final TextEditingController _nameAccController = TextEditingController();
  final TextEditingController _bankAccController = TextEditingController();

  void _showAppBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AppBottomSheet(
          onClose: () {
            print('BottomSheet đóng');
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.button,
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: Text(
              'Thêm tài khoản nhận tiền',
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
        const Gap(50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black4,
                ),
                children: [
                  TextSpan(text: 'Số tài khoản'),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            AppTextField(
              hint: "",
              hintStyle: GoogleFonts.publicSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.black4,
              ),
              controller: _numAccController,
            ),
          ],
        ),
        const Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black4,
                ),
                children: [
                  TextSpan(text: 'Tên tài khoản'),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            AppTextField(
              hint: "",
              hintStyle: GoogleFonts.publicSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.black4,
              ),
              controller: _nameAccController,
            ),
          ],
        ),
        const Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black4,
                ),
                children: [
                  TextSpan(text: 'Ngân hàng'),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            AppTextField(
              readOnly: true,
              hint: "",
              hintStyle: GoogleFonts.publicSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.black4,
              ),
              controller: _bankAccController,
              suffixIcon: const Icon(
                FontAwesomeIcons.chevronDown,
                size: 15,
                color: AppColors.black4,
              ),
              onSuffixIconTap: () => _showAppBottomSheet(context),
            ),
          ],
        ),
        const Gap(60),
        AppButton(
          onPressed: () {
            Get.toNamed(AppRoute.accountlist.name);
          },
          buttonText: "THÊM MỚI",
          sizeButton: 'medium',
        ),
      ],
    );
  }
}
