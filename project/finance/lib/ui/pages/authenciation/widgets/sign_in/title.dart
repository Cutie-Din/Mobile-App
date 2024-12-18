import 'package:finance/import.dart';

class SignInContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getResponsiveScale(context, 40.0)),
      child: Align(
        alignment: Alignment.centerLeft, // Căn lề trái cho toàn bộ nội dung
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Đảm bảo nội dung căn đều sang trái
          children: <Widget>[
            // Tiêu đề
            Text(
              'Đăng nhập',
              style: TextStyle(
                fontFamily: "PublicSans",
                fontSize: getResponsiveFontSize(context, small: 24.0, medium: 28.0, large: 32.0),
                fontWeight: AppFonts.bold,
                // height: AppFonts.lineHeightLg,
              ),
              textAlign: TextAlign.left, // Căn lề trái cho text
            ),
            const SizedBox(height: 30), // Khoảng cách giữa các thành phần
          ],
        ),
      ),
    );
  }
}
