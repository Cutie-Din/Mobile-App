import 'package:finance/import.dart';

import 'widgets/sign_in/button.dart';
import 'widgets/sign_in/form.dart';
import 'widgets/sign_in/title.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: Padding(
          padding: getResponsivePadding(context),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 110),
                  SignInContent(),
                  SignInForm(),
                  const SizedBox(height: 15),
                  SignInButton(),
                  const SizedBox(height: 26),
                  Image.asset(
                    AppImg.signIn,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.38,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
