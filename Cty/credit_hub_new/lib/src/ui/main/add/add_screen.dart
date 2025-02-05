import 'package:credit_hub_new/src/utils/app_export.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.button,
      appBar: AppBar(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: Text(
              'Tạo yêu cầu rút tiền',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.black4,
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.chevronLeft,
            size: 12,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
