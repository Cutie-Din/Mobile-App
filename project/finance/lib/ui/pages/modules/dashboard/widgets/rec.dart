import 'package:finance/import.dart';

class RecDashBoard extends StatelessWidget {
  const RecDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0), // Optional padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left rounded rectangle with shadow
          Container(
            height: 65, // Height of the rectangle
            width: 170, // Width of the rectangle
            decoration: BoxDecoration(
              color: AppColors.bg, // Background color for the rectangle
              borderRadius: BorderRadius.circular(10), // Rounded corners
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54, // Darker shadow color
                  blurRadius: 8.0, // Increased blur radius
                  spreadRadius: 2.0, // Increased spread radius
                  offset: Offset(0, 2), // Adjusted shadow offset
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0), // Padding for inner content
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align texts to the left
                children: const [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the texts vertically
                    crossAxisAlignment: CrossAxisAlignment.start, // Align texts to the left
                    children: [
                      Text(
                        '70', // Replace with your dynamic number
                        style: TextStyle(
                          color: AppColors.main, // Number color
                          fontFamily: "PublicSans",
                          fontWeight: AppFonts.bold,
                          fontSize: AppFonts.fontSize20, // Adjust font size as needed
                        ),
                      ),
                      Text(
                        'Yêu cầu chờ quyết toán', // Text below the number
                        style: TextStyle(
                          color: Colors.black, // Text color
                          fontFamily: "PublicSans",
                          fontWeight: AppFonts.regular,
                          fontSize: AppFonts.fontSize12, // Adjust font size as needed
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
            width: 170, // Width of the rectangle
            decoration: BoxDecoration(
              color: AppColors.bg, // Background color for the rectangle
              borderRadius: BorderRadius.circular(10), // Rounded corners
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54, // Darker shadow color
                  blurRadius: 8.0, // Increased blur radius
                  spreadRadius: 2.0, // Increased spread radius
                  offset: Offset(0, 2), // Adjusted shadow offset
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0), // Padding for inner content
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align texts to the left
                children: const [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the texts vertically
                    crossAxisAlignment: CrossAxisAlignment.start, // Align texts to the left
                    children: [
                      Text(
                        '332.248.000', // Replace with your dynamic number
                        style: TextStyle(
                          color: AppColors.right_rec, // Number color
                          fontFamily: "PublicSans",
                          fontWeight: AppFonts.bold,
                          fontSize: AppFonts.fontSize20, // Adjust font size as needed
                        ),
                      ),
                      Text(
                        'Số tiền chờ quyết toán', // Text below the number
                        style: TextStyle(
                          color: Colors.black, // Text color
                          fontFamily: "PublicSans",
                          fontWeight: AppFonts.regular,
                          fontSize: AppFonts.fontSize12, // Adjust font size as needed
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
