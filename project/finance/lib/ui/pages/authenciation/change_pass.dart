import 'package:finance/import.dart';

import 'widgets/change_pass/button.dart';
import 'widgets/change_pass/form.dart';
import 'widgets/change_pass/title.dart';

class ChangePassScreen extends StatelessWidget {
  const ChangePassScreen({super.key});

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
                ChangePassContent(),
                const SizedBox(height: 20),
                ChangePassForm(),
                const SizedBox(height: 20),
                ChangePassButton(),
                const Spacer(flex: 7), // Ensures spacing at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
