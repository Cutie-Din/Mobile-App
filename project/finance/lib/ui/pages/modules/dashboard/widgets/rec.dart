import 'package:finance/import.dart';

class RecDashBoard extends StatelessWidget {
  const RecDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getResponsivePadding(context), // Responsive padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Left rounded rectangle with shadow
          Container(
            height: 65, // Height of the rectangle
            width: 160, // Width of the rectangle
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0), // Padding for inner content
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '70', // Replace with your dynamic number
                        style: TextStyle(
                          color: AppColors.main,
                          fontFamily: "PublicSans",
                          fontWeight: AppFonts.bold,
                          fontSize: getResponsiveFontSize(context,
                              small: AppFonts.fontSize20,
                              medium: AppFonts.fontSize22,
                              large: AppFonts.fontSize24), // Responsive font size
                        ),
                      ),
                      Text(
                        'Yêu cầu chờ quyết toán',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "PublicSans",
                          fontWeight: AppFonts.regular,
                          fontSize: getResponsiveFontSize(context,
                              small: AppFonts.fontSize12,
                              medium: AppFonts.fontSize14,
                              large: AppFonts.fontSize16), // Responsive font size
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Right rounded rectangle with shadow
          Container(
            height: 65, // Height of the rectangle
            width: 160, // Width of the rectangle
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '332.248.000', // Replace with your dynamic number
                        style: TextStyle(
                          color: AppColors.right_rec,
                          fontFamily: "PublicSans",
                          fontWeight: AppFonts.bold,
                          fontSize: getResponsiveFontSize(context,
                              small: AppFonts.fontSize20,
                              medium: AppFonts.fontSize22,
                              large: AppFonts.fontSize24), // Responsive font size
                        ),
                      ),
                      Text(
                        'Số tiền chờ quyết toán',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "PublicSans",
                          fontWeight: AppFonts.regular,
                          fontSize: getResponsiveFontSize(context,
                              small: AppFonts.fontSize12,
                              medium: AppFonts.fontSize14,
                              large: AppFonts.fontSize16), // Responsive font size
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
