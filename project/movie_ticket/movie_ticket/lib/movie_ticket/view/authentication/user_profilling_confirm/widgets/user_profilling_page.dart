import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/constants/colors.dart';
import '../../../../../util/constants/fonts.dart';
import '../../../../../util/constants/icon&ill_strings.dart';
import '../../../../../util/constants/sizes.dart';
import '../../../../../util/constants/text_strings.dart';

class UserProfillingPage extends StatefulWidget {
  const UserProfillingPage({super.key});

  @override
  _UserProfillingPageState createState() => _UserProfillingPageState();
}

class _UserProfillingPageState extends State<UserProfillingPage> {
  // List of genres
  final List<String> genres = [
    AppText.up_Horror,
    AppText.up_Action,
    AppText.up_Drama,
    AppText.up_War,
    AppText.up_Comedy,
    AppText.up_Crime,
  ];

  // List of languages
  final List<String> langs = [
    AppText.up_VN,
    AppText.up_EN,
    AppText.up_JP,
    AppText.up_KR,
  ];

  // Store selected genres and language
  final Set<String> selectedGenres = {};
  String? selectedLanguage;

  bool get isNextButtonActive =>
      selectedGenres.isNotEmpty && selectedLanguage != null;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Text (Select Your Genre)
            Text(
              '${AppText.up_selectUr}\n${AppText.up_Genre}',
              style: TextStyle(
                color: AppColors.whiteBgr,
                fontFamily: "Montserrat",
                fontSize: AppSizes.fontSizeLg,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),

            // GridView for Genres
            GridView.builder(
              shrinkWrap:
                  true, // Ensures the GridView only takes the necessary height
              physics:
                  const NeverScrollableScrollPhysics(), // Disable grid scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio:
                    2.5, // Adjust height/width ratio of grid items
              ),
              itemCount: genres.length,
              itemBuilder: (context, index) {
                final genre = genres[index];
                final isSelected = selectedGenres.contains(genre);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle selection for genres
                      if (isSelected) {
                        selectedGenres.remove(genre);
                      } else {
                        selectedGenres.add(genre);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.mainColor
                          : AppColors.darkBgr_2,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        genre,
                        style: const TextStyle(
                          color: AppColors.whiteBgr,
                          fontFamily: "Montserrat",
                          fontSize: AppSizes.fontSizeMd,
                          fontWeight: AppFonts.light,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: AppSizes.spaceBtwInputFields * 2),

            // Another Text Section for Language
            Text(
              '${AppText.up_selectUr}\n${AppText.up_Lang}',
              style: TextStyle(
                color: AppColors.whiteBgr,
                fontFamily: "Montserrat",
                fontSize: AppSizes.fontSizeLg,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),

            // GridView for Languages
            GridView.builder(
              shrinkWrap:
                  true, // Ensures the GridView only takes the necessary height
              physics:
                  const NeverScrollableScrollPhysics(), // Disable grid scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio:
                    2.5, // Adjust height/width ratio of grid items
              ),
              itemCount: langs.length,
              itemBuilder: (context, index) {
                final lang = langs[index];
                final isSelected = selectedLanguage == lang;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // Set selected language
                      selectedLanguage = lang;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.mainColor
                          : AppColors.darkBgr_2,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        lang,
                        style: const TextStyle(
                          color: AppColors.whiteBgr,
                          fontFamily: "Montserrat",
                          fontSize: AppSizes.fontSizeMd,
                          fontWeight: AppFonts.light,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: AppSizes.spaceBtwInputFields * 2),

            // Circular Elevated Button at the bottom
            Center(
              child: SizedBox(
                height: 64,
                width: 64,
                child: ElevatedButton(
                  onPressed: isNextButtonActive
                      ? () {
                          // Add your action here when the button is active
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.resolveWith<Color>((states) {
                      return isNextButtonActive
                          ? AppColors.mainColor
                          : AppColors.darkBgr_2; // Change color based on state
                    }),
                    shape: WidgetStateProperty.all(const CircleBorder()),
                  ),
                  child: Transform.translate(
                    offset: Offset(-6, 0),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30, // Adjust size of the icon if needed
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
