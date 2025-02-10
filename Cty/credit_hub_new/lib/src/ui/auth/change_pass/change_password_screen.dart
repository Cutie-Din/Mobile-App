import 'package:credit_hub_new/src/ui/auth/change_pass/cubit/change_password_cubit.dart';
import 'package:credit_hub_new/src/ui/auth/change_pass/cubit/change_password_state.dart';
import 'package:credit_hub_new/src/utils/app_export.dart';
import 'package:credit_hub_new/src/utils/app_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();

  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  final _formKey = GlobalKey<FormState>();

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

  ChangePasswordCubit get _cubit => Get.find<ChangePasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state.status == ChangePasswordStatus.loading) {
            AppLoading.show();
            return;
          }
          AppLoading.dismiss();
          if (state.status == ChangePasswordStatus.success) {
            Get.offAllNamed(AppRoute.signIn.name);
            return;
          }
          if (state.status == ChangePasswordStatus.failure) {
            AppDialog.show(context, msg: state.message);
            return;
          }
        },
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: Column(
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
                  validator: AppValidator.validatePassword,
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
                  validator: AppValidator.validatePassword,
                  hint: "Xác nhận mật khẩu",
                  hintStyle: GoogleFonts.publicSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black4,
                  ),
                  controller: _oldPasswordController,
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
                    if (_formKey.currentState!.validate()) {
                      // Kiểm tra hợp lệ
                      String _newPassword = _newPasswordController.text;
                      String _oldPassword = _oldPasswordController.text;
                      _cubit.changePassword(new_password: _newPassword, old_password: _oldPassword);
                    }
                  },
                  buttonText: "XÁC NHẬN",
                  sizeButton: 'large',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
