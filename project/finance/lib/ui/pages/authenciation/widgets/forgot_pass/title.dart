import 'package:finance/import.dart';

class ForgotContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getResponsiveScale(context, 40.0)), // Indent from the left
      child: Align(
        alignment: Alignment.centerLeft, // Căn lề trái cho toàn bộ nội dung
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Đảm bảo nội dung căn đều sang trái
          children: <Widget>[
            // Tiêu đề
            Text(
              'Quên mật khẩu',
              style: TextStyle(
                fontFamily: "PublicSans",
                fontSize: getResponsiveFontSize(context, small: 24.0, medium: 28.0, large: 32.0),
                fontWeight: AppFonts.bold,
              ),
              textAlign: TextAlign.left, // Căn lề trái cho text
            ),
            const SizedBox(height: 10), // Khoảng cách giữa các thành phần
            Text(
              'Quên mật khẩu? Nhập email của bạn vào đây, chúng tôi sẽ cấp lại cho bạn qua email',
              style: TextStyle(
                fontFamily: "PublicSans",
                fontSize: getResponsiveFontSize(context, small: 16.0, medium: 18.0, large: 20.0),
                fontWeight: AppFonts.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
