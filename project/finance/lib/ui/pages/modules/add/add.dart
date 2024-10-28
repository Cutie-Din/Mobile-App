import 'package:finance/import.dart';

import 'widgets/button.dart';
import 'widgets/form.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final _formKey = GlobalKey<FormState>(); // Global form key

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            'Tạo yêu cầu rút tiền',
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: AppFonts.fontSizeMdd,
              fontWeight: AppFonts.regular,
            ),
          )),
          backgroundColor: AppColors.bg,
        ),
        backgroundColor: AppColors.bg,
        body: Padding(
          padding: const EdgeInsets.all(16.0), // Padding chung
          child: SingleChildScrollView(
            // Thêm SingleChildScrollView để cuộn
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10), // Thêm khoảng cách trên
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
                          // Thực hiện hành động khi nhấn nút OK
                        },
                      ).show(); // Hiện dialog
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
