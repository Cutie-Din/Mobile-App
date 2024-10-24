import 'package:finance/import.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'dart:async';

class OTPForm extends StatefulWidget {
  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  late Timer _timer;
  int _countdown = 120; // 2-minute countdown

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _countdown = 120;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  String _formatCountdown() {
    final minutes = (_countdown ~/ 60).toString(); // Get the minutes
    final seconds =
        (_countdown % 60).toString().padLeft(2, '0'); // Get the seconds and pad if needed
    return "$minutes:$seconds"; // Format as x:xx
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Padding(
          padding: getResponsivePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Using OtpTextField from the package
              OtpTextField(
                numberOfFields: 4,
                borderColor: AppColors.bgSign_in,
                fillColor: AppColors.bg,
                filled: true,
                showFieldAsBox: true, // Display the fields as boxes
                fieldWidth: 50,
                onCodeChanged: (String code) {
                  // Handle changes if needed
                },
                onSubmit: (String otp) {
                  // Handle when OTP is complete
                  print("OTP entered: $otp");
                },
              ),
              SizedBox(
                height: getResponsiveScale(context, 20.0),
              ),
              Center(
                child: _countdown > 0
                    ? Text(
                        "Gửi lại mã sau ${_formatCountdown()} phút",
                        style: TextStyle(
                          fontSize: AppFonts.fontSizeMd,
                          fontFamily: "PublicSans",
                          color: AppColors.main,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _startCountdown(); // Resend and restart countdown
                          // Add logic to resend OTP here
                        },
                        child: Text(
                          'Gửi lại mã',
                          style: TextStyle(
                              fontFamily: "PublicSans",
                              fontSize: AppFonts.fontSizeMd,
                              color: AppColors.buttonSign_in),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
