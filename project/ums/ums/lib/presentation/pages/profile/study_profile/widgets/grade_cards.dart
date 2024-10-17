import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/device.dart';
import '../../../../../core/constants/fonts.dart';
import '../../../../bloc/study_profile/study_profile_bloc.dart';
import '../../../../bloc/study_profile/study_profile_event.dart';
import '../../../../bloc/study_profile/study_profile_state.dart';
import 'dart:io';

class GradeCardGrid extends StatelessWidget {
  const GradeCardGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDeviceUtils.screenWidth(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
      child: BlocBuilder<StudyProfileBloc, StudyProfileState>(
        builder: (context, state) {
          return Column(
            children: [
              // Directly including the title rows
              _buildImageRow(state.imagePaths, context),
              SizedBox(height: AppDeviceUtils.screenHeight(context) * 0.01),
              _buildImageRow(state.imagePaths, context, startIndex: 3),
            ],
          );
        },
      ),
    );
  }

  Widget _buildImageRow(List<String?> imagePaths, BuildContext context, {int startIndex = 0}) {
    double screenWidth = AppDeviceUtils.screenWidth(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(3, (index) {
        final imageIndex = startIndex + index;
        return GestureDetector(
          onTap: () => _pickImage(context, imageIndex),
          child: Column(
            children: [
              imagePaths[imageIndex] != null
                  ? Image.file(
                      File(imagePaths[imageIndex]!),
                      width: screenWidth * 0.25,
                      height: screenWidth * 0.25,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: screenWidth * 0.25,
                      height: screenWidth * 0.25,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        // Centering the icon
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          color: Colors.grey,
                          onPressed: () =>
                              _pickImage(context, imageIndex), // Pass the correct index
                        ),
                      ),
                    ),
              SizedBox(height: 8), // Add spacing between image and title
              Text(
                _getImageTitle(imageIndex),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: AppFonts.fontSizeSm, color: AppColors.main),
              ),
            ],
          ),
        );
      }),
    );
  }

  String _getImageTitle(int index) {
    switch (index) {
      case 0:
        return 'Lớp 10 Học tập';
      case 1:
        return 'Lớp 11 Học tập';
      case 2:
        return 'Lớp 12 Học tập';
      case 3:
        return 'Lớp 10 Nhận xét';
      case 4:
        return 'Lớp 11 Nhận xét';
      case 5:
        return 'Lớp 12 Nhận xét';
      default:
        return '';
    }
  }

  Future<void> _pickImage(BuildContext context, int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Dispatch the PickImageEvent to the BLoC with the selected image path
      context.read<StudyProfileBloc>().add(PickImageEvent(index, image.path));
      print('Image picked at index $index: ${image.path}'); // Debugging output
    } else {
      // Handle when no image is picked
      print('No image selected.');
    }
  }
}
