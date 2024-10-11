import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/device.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/text_strings.dart';
import '../user_profile/widgets/user_header.dart';

import 'widgets/custom_dropdown.dart';
import 'widgets/grade_cards.dart';

class StudyProfileScreen extends StatefulWidget {
  const StudyProfileScreen({super.key});

  @override
  _StudyProfileScreenState createState() => _StudyProfileScreenState();
}

class _StudyProfileScreenState extends State<StudyProfileScreen> {
  String? selectedCity;
  String? selectedSchool;

  final List<String> cities = ['Hà Nội', 'Hồ Chí Minh', 'Đà Nẵng', 'Cần Thơ'];
  final List<String> schools = ['Trường THPT A', 'Trường THPT B', 'Trường THPT C'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDeviceUtils.screenWidth(context);
    double screenHeight = AppDeviceUtils.screenHeight(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppText.qtht,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: AppFonts.fontSizeMd,
            color: AppColors.bg,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.bg,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppColors.main,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserHeader(),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              CustomDropdown(
                label: 'Tỉnh/Thành phố',
                value: selectedCity,
                items: cities,
                onChanged: (newValue) {
                  setState(() {
                    selectedCity = newValue;
                  });
                },
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              CustomDropdown(
                label: 'Trường THPT',
                value: selectedSchool,
                items: schools,
                onChanged: (newValue) {
                  setState(() {
                    selectedSchool = newValue;
                  });
                },
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              GradeCardGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
