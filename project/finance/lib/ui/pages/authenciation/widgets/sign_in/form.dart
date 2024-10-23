import 'package:finance/import.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _obscureText = true; // Biến để quản lý trạng thái ẩn/hiện mật khẩu

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
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
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.bgSign_in, // Màu viền mặc định
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.bgSign_in, // Màu viền khi trường được kích hoạt
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.bg, // Màu viền khi trường được focus
                    ),
                  ),
                  fillColor: AppColors.bgSign_in,
                  filled: true,
                  labelStyle: TextStyle(
                    color: AppColors.textSign_in,
                    fontSize: getResponsiveFontSize(context),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: getResponsiveScale(context, 15.0)),

              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.bgSign_in, // Màu viền mặc định
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.bgSign_in, // Màu viền khi trường được kích hoạt
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.bg, // Màu viền khi trường được focus
                    ),
                  ),
                  fillColor: AppColors.bgSign_in,
                  filled: true,
                  labelStyle: TextStyle(
                    fontSize: getResponsiveFontSize(context), // Responsive font size
                    color: AppColors.textSign_in,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textSign_in,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText; // Thay đổi trạng thái ẩn/hiện
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
