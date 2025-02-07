import 'package:credit_hub_new/src/utils/app_export.dart';

class AppButton extends StatefulWidget {
  final Function? onPressed;
  final String buttonText;
  final bool transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final String sizeButton;

  const AppButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.transparent = false,
    this.margin,
    this.width,
    this.height,
    this.fontSize,
    this.icon,
    this.color,
    this.textColor,
    this.sizeButton = 'medium',
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  double get _height {
    if (widget.height != null) {
      return widget.height!;
    }

    switch (widget.sizeButton) {
      case 'small':
        return 65;
      case 'large':
        return 56;
      default:
        return 65;
    }
  }

  double get _width {
    if (widget.width != null) {
      return widget.width!;
    }

    switch (widget.sizeButton) {
      case 'small':
        return 55;
      case 'medium':
        return 270;
      case 'large':
        return 327;
      default:
        return 270;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isRefresh = widget.buttonText == 'Làm mới';

    final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: isRefresh
          ? AppColors.button
          : widget.onPressed == null
              ? AppColors.primary
              : widget.transparent
                  ? Colors.transparent
                  : widget.color ?? AppColors.primary,
      disabledBackgroundColor: AppColors.primary,
      padding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );

    return Center(
      child: SizedBox(
        width: _width,
        height: _height,
        child: ElevatedButton(
          onPressed: widget.onPressed as void Function()?,
          style: elevatedButtonStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.buttonText,
                textAlign: TextAlign.center,
                style: GoogleFonts.publicSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isRefresh ? AppColors.black5 : AppColors.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
