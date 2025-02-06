import 'package:credit_hub_new/src/components/bottomsheet/bank/app_bank_picker.dart';
import 'package:credit_hub_new/src/utils/app_export.dart';

class AppBottomSheet extends StatefulWidget {
  final VoidCallback onClose;

  const AppBottomSheet({
    super.key,
    required this.onClose,
  });

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 772,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          // Đóng icon button
          Positioned(
            right: 10,
            top: 10,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                size: 25,
                color: AppColors.grey7,
              ),
              onPressed: () {
                widget.onClose();
                Navigator.pop(context); // Đóng Bottom Sheet
              },
            ),
          ),

          // Tìm kiếm
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: TextField(
              controller: searchController,
              // onChanged: _onSearchChanged,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF0F5FE),
                hintText: "Tìm kiếm",
                hintStyle: GoogleFonts.publicSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF8F96AD)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Bank Picker: Đảm bảo nó không bị đè lên các phần tử khác, thêm vào một `SingleChildScrollView` để cuộn
          Positioned.fill(
            top: 140, // Đảm bảo phần bankPicker không bị đè lên phần tử trên
            child: SingleChildScrollView(
              child: SizedBox(
                height:
                    400, // Cung cấp chiều cao cho `bankPicker` để nó có thể được hiển thị và cuộn
                child: bankPicker(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
