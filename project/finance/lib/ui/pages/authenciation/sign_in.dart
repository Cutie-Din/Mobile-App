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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(flex: 4), // Pushes the content upwards
                SignInContent(),

                SignInForm(),
                const SizedBox(height: 20),
                SignInButton(),
                const SizedBox(height: 20),
                const Spacer(flex: 1),
                SvgPicture.asset(
                  AppImg.signIn, // Path to your SVG asset
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
