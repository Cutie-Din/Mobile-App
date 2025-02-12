import 'package:credit_hub_new/src/ui/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:credit_hub_new/src/ui/auth/sign_in/cubit/sign_in_state.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:credit_hub_new/src/utils/app_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>(); // Thêm GlobalKey
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  SignInCubit get _cubit => Get.find<SignInCubit>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInCubit, SignInState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state.status == SignInStatus.loading) {
            AppLoading.show();
            return;
          }
          AppLoading.dismiss();
          if (state.status == SignInStatus.success) {
            Get.offAllNamed(AppRoute.main.name);
            return;
          }
          if (state.status == SignInStatus.failure) {
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
          Image.asset(AppImages.header_signin),
          const Gap(80),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: const Alignment(-0.65, -0.5),
                  child: Text(
                    "Đăng nhập",
                    style: GoogleFonts.publicSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Gap(50),
                AppTextField(
                  validator: AppValidator.validateUsername, // Validator sẽ hoạt động
                  hint: "Tên đăng nhập",
                  hintStyle: GoogleFonts.publicSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black4,
                  ),
                  controller: _usernameController,
                ),
                const Gap(5),
                AppTextField(
                  validator: AppValidator.validatePassword, // Validator sẽ hoạt động
                  hint: "Mật khẩu",
                  hintStyle: GoogleFonts.publicSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black4,
                  ),
                  controller: _passwordController,
                  obscureText: _obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.primary,
                    ),
                    onPressed: _toggle,
                  ),
                ),
                Align(
                  alignment: const Alignment(0.72, -0.5),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.forgotPassword.name);
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(
                      "Quên mật khẩu?",
                      style: GoogleFonts.publicSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const Gap(15),
                AppButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Kiểm tra hợp lệ
                      String userNameLogin = _usernameController.text;
                      String passwordLogin = _passwordController.text;
                      _cubit.signIn(username: userNameLogin, password: passwordLogin);
                    }
                  },
                  buttonText: "ĐĂNG NHẬP",
                  sizeButton: 'large',
                ),
              ],
            ),
          ),
          Image.asset(AppImages.footer_signin),
        ],
      ),
    );
  }
}
