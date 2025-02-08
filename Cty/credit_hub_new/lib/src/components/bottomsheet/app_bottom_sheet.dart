import 'package:credit_hub_new/src/utils/app_export.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

part 'app_bank_picker.dart';
part 'app_date_picker.dart';

class AppBottomSheet extends StatelessWidget {
  final VoidCallback onClose;
  final String pickerType; // Thêm pickerType để kiểm tra

  const AppBottomSheet({
    super.key,
    required this.onClose,
    required this.pickerType, // Nhận giá trị pickerType
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
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: _buildPicker(), // Gọi widget dựa trên pickerType
        ),
      ),
    );
  }

  /// Chọn widget tương ứng dựa trên giá trị pickerType
  Widget _buildPicker() {
    switch (pickerType) {
      case 'AppDatePicker':
        return AppDatePicker();
      case 'AppBankPicker':
        return AppBankPicker(
          onClose: () {},
        );
      default:
        return Center(
          child: Text(
            'Invalid picker type',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        );
    }
  }
}
