import 'package:finance/import.dart';

import 'widgets/forgot_pass/button.dart';
import 'widgets/forgot_pass/form.dart';
import 'widgets/forgot_pass/title.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Padding(
        padding: getResponsivePadding(context),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(), // Pushes the content upwards
              ForgotContent(),
              const SizedBox(height: 20),
              ForgotForm(),
              const SizedBox(height: 20),
              ForgotButton(),
              const Spacer(flex: 9), // Ensures spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
