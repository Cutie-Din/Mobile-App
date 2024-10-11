import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/fonts.dart';
import '../../../../../core/constants/device.dart';

class GradeCardGrid extends StatefulWidget {
  const GradeCardGrid({Key? key}) : super(key: key);

  @override
  _GradeCardGridState createState() => _GradeCardGridState();
}

class _GradeCardGridState extends State<GradeCardGrid> {
  List<String?> _imagePaths = List.filled(6, null); // List to store image paths

  Future<void> _pickImage(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print('Image picked: ${pickedFile.path}'); // Log the picked image path
      setState(() {
        _imagePaths[index] = pickedFile.path; // Update the corresponding image path
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDeviceUtils.screenWidth(context);
    double screenHeight = AppDeviceUtils.screenHeight(context);

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(), // Disable scrolling for this GridView
        shrinkWrap: true, // Allow the GridView to take up only the required space
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          childAspectRatio: 1.0, // Aspect ratio for the grid items
        ),
        itemCount: 6, // Total number of items
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _pickImage(index), // Open image picker on tap
            child: Card(
              color: AppColors.bg,
              margin: EdgeInsets.all(screenWidth * 0.02), // Responsive margin
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lớp ${10 + (index ~/ 2)} ${index % 2 == 0 ? 'Học tập' : 'Nhận xét'}',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _imagePaths[index] != null
                      ? Image.file(
                          File(_imagePaths[index]!),
                          width: screenWidth * 0.25, // Responsive image size
                          height: screenWidth * 0.25, // Responsive image size
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: screenWidth * 0.25, // Responsive size
                          height: screenWidth * 0.25, // Responsive size
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.add_a_photo,
                            color: Colors.grey,
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
