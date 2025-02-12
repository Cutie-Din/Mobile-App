import 'package:credit_hub_new/src/shared/app_export.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.button,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Thông báo',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.black4,
              ),
            ),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: Column(
              children: [
                _buildNotify(
                  "Yêu cầu về lô 000372 của bạn đang được quyết toán",
                  "2020-05-06 11:24:08",
                ),
                const Gap(15),
                _buildNotify(
                  "Yêu cầu về lô 000372 của bạn không được quyết toán",
                  "2020-05-06 11:24:08",
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildNotify(String text, String timestamp) {
    Color backgroundColor = Colors.white;
    Color borderColor = Colors.transparent;

    if (text != null && text!.contains("không được")) {
      backgroundColor = const Color(0xFFFF6E41).withOpacity(0.1);
      borderColor = Colors.grey.withOpacity(0.1);
    } else {
      borderColor = Colors.grey.withOpacity(0.1);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nội dung chính của thông báo
          Text(
            text,
            style: GoogleFonts.publicSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.black5,
            ),
          ),
          const Gap(10),
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.clock,
                size: 12,
                color: AppColors.grey2,
              ),
              const Gap(5),
              Text(
                timestamp,
                style: GoogleFonts.publicSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
