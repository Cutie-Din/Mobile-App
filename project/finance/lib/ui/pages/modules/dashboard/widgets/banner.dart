import 'package:finance/import.dart';

class BannerDashBoard extends StatelessWidget {
  const BannerDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    final double screenHeight = MediaQuery.of(context).size.height;

    // Define the height for the banner (30% of the screen height)
    final double bannerHeight = screenHeight * 0.3;

    return SizedBox(
      height: bannerHeight, // Set the overall height of the banner
      child: Stack(
        children: [
          // Background image
          SizedBox(
            width: double.infinity,
            height: bannerHeight,
            child: Image.asset(
              AppImg.banner_db,
              fit: BoxFit.cover, // Ensure the image covers the entire area
            ),
          ),
          // Overlay content
          Positioned(
            left: 0,
            right: 0,
            top: bannerHeight / 2 - 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Column for text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: getResponsivePadding(context).left + 15.0), // Responsive padding
                      child: Text(
                        'Welcome to',
                        style: TextStyle(
                          fontFamily: 'PublicSans',
                          color: Colors.white,
                          fontSize: getResponsiveFontSize(context,
                              small: AppFonts.fontSize14,
                              medium: AppFonts.fontSize16,
                              large: AppFonts.fontSize18), // Responsive font size
                          fontWeight: AppFonts.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: getResponsivePadding(context).left + 15.0),
                      child: Text(
                        'CreditHub',
                        style: TextStyle(
                          fontFamily: 'PublicSans',
                          color: Colors.white,
                          fontSize: getResponsiveFontSize(context,
                              small: AppFonts.fontSize36,
                              medium: AppFonts.fontSize36,
                              large: AppFonts.fontSize36), // Responsive font size
                          fontWeight: AppFonts.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                // POS image on the right
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Image.asset(
                    AppImg.pos_db,
                    width: getResponsivePadding(context).left < 20.0
                        ? 100
                        : 142, // Responsive width based on screen size
                    height: getResponsivePadding(context).left < 20.0
                        ? 100
                        : 107, // Responsive height based on screen size
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
