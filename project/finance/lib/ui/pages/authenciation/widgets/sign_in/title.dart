import 'package:finance/import.dart';

class SignInContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft, // Căn lề trái cho toàn bộ nội dung
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Đảm bảo nội dung căn đều sang trái
        children: <Widget>[
          // Tiêu đề
          Text(
            'Đăng nhập',
            style: TextStyle(
              fontSize: getResponsiveFontSize(context, small: 22.0, medium: 28.0, large: 32.0),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left, // Căn lề trái cho text
          ),
          const SizedBox(height: 10), // Khoảng cách giữa các thành phần

          // RichText
          RichText(
            textAlign: TextAlign.left, // Căn lề trái cho đoạn RichText
            text: TextSpan(
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, small: 14.0, medium: 16.0, large: 18.0),
                color: Colors.black,
              ),
              children: const <TextSpan>[
                TextSpan(text: 'Nếu bạn chưa có tài khoản. \n'),
                TextSpan(text: 'Vui lòng '),
                TextSpan(
                  text: 'liên hệ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(text: ' với chúng tôi'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
