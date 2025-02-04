import 'package:credit_hub_new/src/utils/app_export.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
        Image.asset(AppImages.header_signin),
        const Gap(80),
        Expanded(
          child: Column(
            children: [
              const Align(
                alignment: Alignment(-0.65, -0.5),
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(
                    fontFamily: 'PublicSans',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Gap(50),
              AppTextField(
                hint: "Tên đăng nhập",
                hintStyle: const TextStyle(
                  fontFamily: 'PublicSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                controller: _usernameController,
              ),
              const Gap(25),
              AppTextField(
                hint: "Mật khẩu",
                hintStyle: const TextStyle(
                  fontFamily: 'PublicSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
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
              const Gap(15),
              Align(
                alignment: const Alignment(0.72, -0.5),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.forgotPassword.name);
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: const Text(
                    "Quên mật khẩu?",
                    style: TextStyle(
                      fontFamily: 'PublicSans',
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
                  Get.toNamed(AppRoute.main.name);
                },
                buttonText: "Đăng nhập",
                sizeButton: 'large',
              ),
            ],
          ),
        ),
        Image.asset(AppImages.footer_signin),
      ],
    );
  }
}
