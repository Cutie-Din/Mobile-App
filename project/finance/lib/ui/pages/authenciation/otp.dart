import 'package:finance/import.dart';

import 'widgets/otp/button.dart';
import 'widgets/otp/form.dart';
import 'widgets/otp/title.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: Padding(
          padding: getResponsivePadding(context),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(), // Pushes the content upwards
                OTPContent(),
                const SizedBox(height: 20),
                OTPForm(),
                const SizedBox(height: 20),
                OTPButton(),
                const Spacer(flex: 7), // Ensures spacing at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
