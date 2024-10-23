import 'package:finance/import.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getResponsiveScale(context, 1.0), // Responsive width for button
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          // Handle sign in
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonSign_in, // Button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          'Đăng nhập',
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, small: 16.0, medium: 18.0, large: 20.0),
            color: AppColors.bg,
          ),
        ),
      ),
    );
  }
}
