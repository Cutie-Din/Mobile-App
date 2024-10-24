import 'package:finance/import.dart';

class ForgotForm extends StatefulWidget {
  @override
  _ForgotFormState createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
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
                    borderRadius: BorderRadius.circular(22.0),
                    borderSide: BorderSide(
                      color: AppColors.main_bg, // Màu viền mặc định
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    borderSide: BorderSide(
                      color: AppColors.main_bg, // Màu viền khi trường được kích hoạt
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
