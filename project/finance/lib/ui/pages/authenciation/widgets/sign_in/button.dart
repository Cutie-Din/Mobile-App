import 'package:finance/import.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getResponsiveScale(context, 1.09), // Responsive width for button
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/menu');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.main, // Button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          'Đăng nhập',
          style: TextStyle(
              fontFamily: "Roboto",
              fontSize: AppFonts.fontSize15,
              fontWeight: AppFonts.medium,
              color: AppColors.bg),
        ),
      ),
    );
  }
}
