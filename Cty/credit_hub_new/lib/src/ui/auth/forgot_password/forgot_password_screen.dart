import 'package:credit_hub_new/src/ui/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:credit_hub_new/src/ui/auth/forgot_password/cubit/forgot_password_state.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:credit_hub_new/src/utils/app_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  ForgotPasswordCubit get _cubit => Get.find<ForgotPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state.status == ForgotPasswordStatus.loading) {
            AppLoading.show();
            return;
          }
          AppLoading.dismiss();
          if (state.status == ForgotPasswordStatus.success) {
            Get.offAllNamed(AppRoute.otp.name, arguments: _emailController.text);
            return;
          }
          if (state.status == ForgotPasswordStatus.failure) {
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
                  alignment: const Alignment(-0.59, -0.5),
                  child: Text(
                    "Quên mật khẩu",
                    style: GoogleFonts.publicSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black4,
                    ),
                  ),
                ),
                const Gap(20),
                Text(
                  'Quên mật khẩu? Nhập email của bạn vào\nđây, chúng tôi sẽ cấp lại cho bạn qua email',
                  style: GoogleFonts.publicSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black4,
                  ),
                ),
                const Gap(50),
                AppTextField(
                  validator: AppValidator.validateEmail,
                  hint: "Email",
                  hintStyle: GoogleFonts.publicSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black4,
                  ),
                  controller: _emailController,
                ),
                const Gap(25),
                AppButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Kiểm tra hợp lệ
                      String emailForgot = _emailController.text;

                      _cubit.sendEmail(email: emailForgot);
                    }
                  },
                  buttonText: "GỬI",
                  sizeButton: 'large',
                ),
                const Gap(25),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AppImages.back_icon,
                          color: AppColors.primary,
                        ),
                        const Gap(10),
                        Text(
                          "Trở lại đăng nhập",
                          style: GoogleFonts.publicSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
