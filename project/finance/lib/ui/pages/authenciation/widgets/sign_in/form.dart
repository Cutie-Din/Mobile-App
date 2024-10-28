import 'package:finance/import.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _obscureText = true; // Biến để quản lý trạng thái ẩn/hiện mật khẩu

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: getResponsivePadding(context), // Sử dụng padding responsive
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // TextFormField để nhập email
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                    color: AppColors.main_bg, // Màu viền mặc định
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                    color: AppColors.main_bg, // Màu viền khi trường được kích hoạt
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                    color: AppColors.main_bg, // Màu viền khi trường được focus
                  ),
                ),
                fillColor: AppColors.main_bg,
                filled: true,
                labelStyle: TextStyle(
                  fontFamily: "PublicSans",
                  fontWeight: AppFonts.regular,
                  fontSize: AppFonts.fontSizeMd,
                  color: AppColors.main_text,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(
              height: getResponsiveScale(context, 15.0),
            ),

            TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                    color: AppColors.main_bg, // Màu viền mặc định
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                    color: AppColors.main_bg, // Màu viền khi trường được kích hoạt
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(
                    color: AppColors.main_bg, // Màu viền khi trường được focus
                  ),
                ),
                fillColor: AppColors.main_bg,
                filled: true,
                labelStyle: TextStyle(
                  fontFamily: "PublicSans",
                  fontWeight: AppFonts.regular,
                  fontSize: AppFonts.fontSizeMd,
                  color: AppColors.main_text,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.main,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText; // Thay đổi trạng thái ẩn/hiện
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: getResponsiveScale(context, 15.0),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/forgotPass');
                },
                child: Text(
                  'Quên mật khẩu ?',
                  style: TextStyle(
                    fontFamily: "PublicSans",
                    fontWeight: AppFonts.regular,
                    fontSize: AppFonts.fontSizeSmest,
                    color: AppColors.main,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
