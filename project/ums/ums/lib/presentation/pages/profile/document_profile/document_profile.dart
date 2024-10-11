import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/device.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/text_strings.dart';
import '../user_profile/widgets/user_header.dart';
import 'widgets/document_cards.dart';

class DocumentProfileScreen extends StatefulWidget {
  const DocumentProfileScreen({super.key});

  @override
  _DocumentProfileScreenState createState() => _DocumentProfileScreenState();
}

class _DocumentProfileScreenState extends State<DocumentProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDeviceUtils.screenWidth(context);
    double screenHeight = AppDeviceUtils.screenHeight(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppText.hssv,
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
              DocumentCardGrid(), // Use the new DocumentCardGrid widget
            ],
          ),
        ),
      ),
    );
  }
}
