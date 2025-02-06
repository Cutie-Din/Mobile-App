import 'package:credit_hub_new/src/utils/app_export.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  Timer? _timer;
  int _remainingTime = 120;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _remainingTime = 120;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
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
                alignment: const Alignment(-0.65, -0.5),
                child: Text(
                  "Nhập OTP",
                  style: GoogleFonts.publicSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black4,
                  ),
                ),
              ),
              const Gap(20),
              Align(
                alignment: const Alignment(-0.4, -0.5),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.publicSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black4,
                    ),
                    children: [
                      const TextSpan(text: 'OTP đã được gửi về email:\n'),
                      TextSpan(
                        text: 'dcv@dcv.vn',
                        style: GoogleFonts.publicSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
                      TextSpan(text: '. Hãy kiểm tra và nhập\nxuống phía dưới'),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              Pinput(
                length: 4,
                controller: _otpController,
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const Gap(20),
              Align(
                alignment: const Alignment(-0.6, -0.5),
                child: GestureDetector(
                  onTap: _remainingTime == 0 ? _startTimer : null,
                  child: Text(
                    _remainingTime > 0
                        ? 'Gửi lại mã sau ${_formatTime(_remainingTime)}'
                        : 'Gửi lại mã',
                    style: GoogleFonts.publicSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ),
              const Gap(25),
              AppButton(
                onPressed: () {
                  Get.toNamed(AppRoute.changePassword.name);
                },
                buttonText: "XÁC THỰC",
                sizeButton: 'large',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
