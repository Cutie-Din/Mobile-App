import 'package:finance/import.dart';
import 'package:flutter/material.dart';

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
            width: 400,
            height: 230,
            child: Image.asset(
              AppImg.banner_db, // Path to your SVG image
              fit: BoxFit.cover, // Ensure the image covers the entire area
            ),
          ),
          // Overlay content
          Positioned(
            left: 0, // Align to the left
            right: 0, // Align to the right
            top: bannerHeight / 2 - 50, // Center vertically (adjust based on text height)
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and image
              children: [
                // Column for text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0), // Add left padding
                      child: Text(
                        'Welcome to',
                        style: TextStyle(
                          fontFamily: 'PublicSans',
                          color: Colors.white, // Text color
                          fontSize: AppFonts.fontSizeSmest, // Adjusted font size
                          fontWeight: AppFonts.bold, // Font weight
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0), // Add left padding
                      child: Text(
                        'CreditHub',
                        style: TextStyle(
                          fontFamily: 'PublicSans',
                          color: Colors.white, // Text color
                          fontSize: AppFonts.fontSizeBg, // Adjusted font size
                          fontWeight: AppFonts.bold, // Font weight
                        ),
                      ),
                    ),
                  ],
                ),
                // POS image on the right
                Padding(
                  padding: const EdgeInsets.only(right: 16.0), // Add right padding
                  child: Image.asset(
                    AppImg.pos_db, // Path to your POS image
                    width: 142, // Adjusted width
                    height: 107, // Adjusted height
                    fit: BoxFit.contain, // Maintain aspect ratio
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
