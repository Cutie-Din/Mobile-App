import 'package:finance/import.dart';
import 'package:flutter/cupertino.dart';

import 'widgets/button.dart';
import 'widgets/form.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final _formKey = GlobalKey<FormState>(); // Global form key

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Lấy danh sách các màn hình hiện có trong ngăn xếp
        final navigator = Navigator.of(context);
        if (navigator.canPop()) {
          // Nếu có thể quay lại, kiểm tra trang trước
          navigator.pop(); // Quay lại trang trước
          return false; // Ngăn chặn hành động quay lại tự động
        }
        return true; // Cho phép quay lại nếu không có trang nào
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              size: 20, // Set a smaller size for the back button icon
            ),
            onPressed: () {
              Navigator.pop(context); // Quay lại màn hình trước
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(
                left: 59.0), // Adjust padding to move the title closer to the leading icon
            child: const Text(
              'Tạo yêu cầu rút tiền',
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: AppFonts.fontSize18,
                fontWeight: AppFonts.regular,
              ),
            ),
          ),
          backgroundColor: AppColors.bg,
          elevation: 0, // Set elevation to 0 for a flat appearance
        ),
        backgroundColor: AppColors.bg,
        body: Padding(
          padding: const EdgeInsets.all(16.0), // General padding
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10), // Add top spacing
                AddForm(formKey: _formKey),
                const SizedBox(height: 30),

                // Button
                AddButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.scale,
                        title: 'Thành công',
                        desc: 'Yêu cầu hợp lệ!',
                        btnOkOnPress: () {
                          // Perform action on OK button press
                        },
                      ).show(); // Show dialog
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
