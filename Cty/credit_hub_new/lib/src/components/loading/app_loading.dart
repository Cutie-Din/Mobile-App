import 'package:credit_hub_new/src/utils/app_export.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  static var isShowing = false;

  static void show() {
    if (!Get.isDialogOpen!) {
      Get.dialog(
        const AppLoading(),
      );
      isShowing = true;
    }
  }

  static void dismiss() {
    if (Get.isDialogOpen! && isShowing) {
      Get.back();
      isShowing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          strokeWidth: 4, // Độ dày của vòng tròn
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
      ),
    );
  }
}
