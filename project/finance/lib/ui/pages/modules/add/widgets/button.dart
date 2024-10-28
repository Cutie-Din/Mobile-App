import 'package:finance/import.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed; // Callback to handle form submission

  AddButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8, // Responsive width
      height: 65.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.main, // Update with your AppColors.main
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          'Gửi yêu cầu',
          style: TextStyle(
            fontFamily: "PublicSans",
            fontSize: AppFonts.fontSizeMd,
            fontWeight: AppFonts.medium,
            color: Colors.white, // Update with your AppColors.bg
          ),
        ),
      ),
    );
  }
}
