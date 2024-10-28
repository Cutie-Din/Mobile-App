import 'package:finance/import.dart';

class ForgotButton extends StatelessWidget {
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
              Navigator.pushNamed(context, '/otp');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.main, // Button background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              'Gửi',
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: AppFonts.fontSize15,
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
              // Handle back action
              Navigator.pop(context); // Navigate back
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
                      fontSize: AppFonts.fontSize16,
                      color: AppColors.main,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Quay lại trang đăng nhập',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: AppFonts.fontSize16,
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
