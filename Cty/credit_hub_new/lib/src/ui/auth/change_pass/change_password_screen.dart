import 'package:credit_hub_new/src/utils/app_export.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  void _toggleNewPasswordVisibility() {
    setState(() {
      _obscureNewPassword = !_obscureNewPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        const Gap(80),
        Expanded(
          child: Column(
            children: [
              Align(
                alignment: const Alignment(-0.6, -0.5),
                child: Text(
                  "Đổi mật khẩu",
                  style: GoogleFonts.publicSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black4,
                  ),
                ),
              ),
              const Gap(50),
              // Trường mật khẩu mới
              AppTextField(
                hint: "Mật khẩu mới",
                hintStyle: GoogleFonts.publicSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black4,
                ),
                controller: _newPasswordController,
                obscureText: _obscureNewPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureNewPassword ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primary,
                  ),
                  onPressed: _toggleNewPasswordVisibility,
                ),
              ),
              const Gap(5),
              // Trường xác nhận mật khẩu
              AppTextField(
                hint: "Xác nhận mật khẩu",
                hintStyle: GoogleFonts.publicSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black4,
                ),
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primary,
                  ),
                  onPressed: _toggleConfirmPasswordVisibility,
                ),
              ),
              const Gap(25),
              AppButton(
                onPressed: () {
                  Get.toNamed(AppRoute.signIn.name);
                },
                buttonText: "XÁC NHẬN",
                sizeButton: 'large',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
