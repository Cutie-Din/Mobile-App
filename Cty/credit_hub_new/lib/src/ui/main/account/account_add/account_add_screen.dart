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
          onClose: () {},
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
        _buildAccountField('Số tài khoản', _numAccController),
        const Gap(20),
        _buildAccountField('Tên tài khoản', _nameAccController),
        const Gap(20),
        _buildBankField(),
        const Gap(60),
        _buildAddButton(),
      ],
    );
  }

  Widget _buildAccountField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        const Gap(10),
        AppTextField(
          hint: "",
          hintStyle: GoogleFonts.publicSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.black4,
          ),
          controller: controller,
        ),
      ],
    );
  }

  Widget _buildLabel(String label) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: 'SFProDisplay',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.black4,
        ),
        children: [
          TextSpan(text: label),
          TextSpan(
            text: '*',
            style: const TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBankField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('Ngân hàng'),
        const Gap(10),
        InkWell(
          onTap: () => _showAppBottomSheet(context),
          child: IgnorePointer(
            child: AppTextField(
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
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton() {
    return AppButton(
      onPressed: () {
        Get.back();
      },
      buttonText: "THÊM MỚI",
      sizeButton: 'medium',
    );
  }
}
