import 'package:finance/import.dart';
import 'package:finance/ui/pages/authenciation/widgets/sign_in/form.dart';

import 'widgets/sign_in/button.dart';
import 'widgets/sign_in/title.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: getResponsivePadding(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInContent(),
              const SizedBox(height: 40),
              SignInForm(),
              const SizedBox(height: 40),
              SignInButton(), // Button widget
            ],
          ),
        ),
      ),
    );
  }
}
