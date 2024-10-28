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
          // Background SVG image
          SizedBox(
            width: double.infinity, // Make it full width
            height: bannerHeight,
            child: Image.asset(
              AppImg.banner_db, // Path to your SVG image
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        'Welcome to',
                        style: TextStyle(
                          fontFamily: 'PublicSans',
                          color: Colors.white,
                          fontSize: AppFonts.fontSize14,
                          fontWeight: AppFonts.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        'CreditHub',
                        style: TextStyle(
                          fontFamily: 'PublicSans',
                          color: Colors.white,
                          fontSize: AppFonts.fontSize36,
                          fontWeight: AppFonts.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                // POS image on the right
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image.asset(
                    AppImg.pos_db, // Path to your POS image
                    width: 142,
                    height: 107,
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
