import 'package:finance/import.dart';

class ChangePassButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Elevated Button
        SizedBox(
          width: getResponsiveScale(context, 1.09), // Responsive width for button
          height: 50.0,
          child: ElevatedButton(
            onPressed: () {
              // Show AwesomeDialog on press
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success, // Success icon
                animType: AnimType.scale,
                title: 'Thành công',
                desc: 'Đổi mật khẩu thành công',
                btnOkText: 'OK',
                btnOkOnPress: () {
                  Navigator.pushNamed(context, '/'); // Navigate to OTP page after OK
                },
              ).show();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.main, // Button background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              'Xác nhận',
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: AppFonts.fontSizeSm,
                  fontWeight: AppFonts.medium,
                  color: AppColors.bg),
            ),
          ),
        ),
        const SizedBox(height: 20), // Add spacing between button and RichText

        // Center widget containing RichText and Icon
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.chevronLeft,
                  color: AppColors.main, // Icon color matching button
                  size: 20,
                ),
                const SizedBox(width: 8), // Space between icon and text
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: "PublicSans",
                      fontSize: AppFonts.fontSizeMd,
                      color: AppColors.main,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Quay lại trang đăng nhập',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: AppFonts.fontSizeMd,
                          fontWeight: AppFonts.regular,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
