import 'package:credit_hub_new/src/utils/app_export.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

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
              const Align(
                alignment: Alignment(-0.59, -0.5),
                child: Text(
                  "Quên mật khẩu",
                  style: TextStyle(
                    fontFamily: 'PublicSans',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Gap(20),
              const Text(
                'Quên mật khẩu? Nhập email của bạn vào\nđây, chúng tôi sẽ cấp lại cho bạn qua email',
                style: TextStyle(
                  fontFamily: 'PublicSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap(50),
              AppTextField(
                hint: "Email",
                hintStyle: const TextStyle(
                  fontFamily: 'PublicSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                controller: _emailController,
              ),
              const Gap(25),
              AppButton(
                onPressed: () {
                  Get.toNamed(AppRoute.otp.name);
                },
                buttonText: "Gửi",
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
                      const Text(
                        "Trở lại đăng nhập",
                        style: TextStyle(
                          fontFamily: 'PublicSans',
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
    );
  }
}
