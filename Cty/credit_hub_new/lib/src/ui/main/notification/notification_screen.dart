import 'package:credit_hub_new/src/utils/app_export.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.button,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Thông báo',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.black4,
            ),
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
