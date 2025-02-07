import 'package:credit_hub_new/src/utils/app_export.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
part 'app_bank_picker.dart';
part 'app_date_picker.dart';

class AppBottomSheet extends StatelessWidget {
  final VoidCallback onClose;

  const AppBottomSheet({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        color: Colors.white, // 🔥 Chuyển màu nền ra ngoài để ClipRRect có tác dụng
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppDatePicker(),
        ),
      ),
    );
  }
}
