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
                  Get.toNamed(AppRoute.otp.name);
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
    );
  }
}
