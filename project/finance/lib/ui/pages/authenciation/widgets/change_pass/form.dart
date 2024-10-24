import 'package:finance/import.dart';

class ChangePassForm extends StatefulWidget {
  @override
  _ChangePassFormState createState() => _ChangePassFormState();
}

class _ChangePassFormState extends State<ChangePassForm> {
  bool _obscureTextNewPass = true;
  bool _obscureTextConfirmPass = true;

  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: getResponsivePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // New password field
              TextFormField(
                controller: _newPasswordController,
                obscureText: _obscureTextNewPass,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu mới',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: AppColors.main_bg,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: AppColors.main_bg,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: AppColors.main_bg,
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
                      _obscureTextNewPass ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.main,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureTextNewPass = !_obscureTextNewPass;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu mới';
                  }
                  return null;
                },
              ),

              SizedBox(height: getResponsiveScale(context, 15.0)),

              // Confirm password field
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureTextConfirmPass,
                decoration: InputDecoration(
                  labelText: 'Nhập lại mật khẩu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: AppColors.main_bg,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: AppColors.main_bg,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: AppColors.main_bg,
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
                      _obscureTextConfirmPass ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.main,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureTextConfirmPass = !_obscureTextConfirmPass;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập lại mật khẩu';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Mật khẩu không trùng khớp';
                  }
                  return null;
                },
              ),

              SizedBox(height: getResponsiveScale(context, 20.0)),
            ],
          ),
        ),
      ),
    );
  }
}
