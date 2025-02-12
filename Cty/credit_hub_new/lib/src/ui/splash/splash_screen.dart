import 'package:credit_hub_new/src/shared/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _nextScreen() async {
    AppRoute nextRoute = AppRoute.signIn;
    Get.offAllNamed(nextRoute.name);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => {_nextScreen()},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: AppColors.cancelled,
          ),
        ),
        const Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Text(
              "Credit Hub",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.button,
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            )),
      ]),
    );
  }
}
