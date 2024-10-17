import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/fonts.dart';
import '../../../../../core/constants/device.dart';
import '../../../bloc/study_profile/study_profile_bloc.dart';
import '../../../bloc/study_profile/study_profile_event.dart';
import '../../../bloc/study_profile/study_profile_state.dart';
import '../user_profile/widgets/user_header.dart';
import 'widgets/custom_dropdown.dart';
import 'widgets/grade_cards.dart';

class StudyProfileScreen extends StatefulWidget {
  const StudyProfileScreen({super.key});

  @override
  _StudyProfileScreenState createState() => _StudyProfileScreenState();
}

class _StudyProfileScreenState extends State<StudyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDeviceUtils.screenWidth(context);

    return BlocProvider(
      create: (context) => StudyProfileBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quá trình học tập',
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: AppFonts.fontSizeMd,
              color: AppColors.bg,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.bg),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: AppColors.main,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserHeader(),
                SizedBox(height: screenWidth * 0.02),
                BlocBuilder<StudyProfileBloc, StudyProfileState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStatusRow(state, screenWidth),
                        CustomDropdown(
                          label: 'Tỉnh/Thành phố',
                          value: state.selectedCity,
                          items: ['Hà Nội', 'Hồ Chí Minh', 'Đà Nẵng', 'Cần Thơ'],
                          onChanged: (newValue) {
                            context.read<StudyProfileBloc>().add(SelectCityEvent(newValue!));
                          },
                        ),
                        CustomDropdown(
                          label: 'Trường THPT',
                          value: state.selectedSchool,
                          items: ['Trường THPT A', 'Trường THPT B', 'Trường THPT C'],
                          onChanged: (newValue) {
                            context.read<StudyProfileBloc>().add(SelectSchoolEvent(newValue!));
                          },
                        ),
                        SizedBox(height: screenWidth * 0.055),
                        const GradeCardGrid(),
                        SizedBox(height: screenWidth * 0.035),
                        if (state.status != StudyProfileStatus.approved)
                          Padding(
                            padding: EdgeInsets.only(
                                top: screenWidth * 0.02, bottom: screenWidth * 0.04),
                            child: Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink,
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenWidth * 0.04,
                                    horizontal: screenWidth * 0.2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () => _showConfirmationDialog(),
                                child: Text(
                                  'Xác nhận',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: AppFonts.fontSizeSm * 1.5,
                                    fontWeight: AppFonts.bold,
                                    color: AppColors.bg,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildStatusRow(StudyProfileState state, double screenWidth) {
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.051),
        Text(
          'Trạng thái:',
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: AppFonts.fontSizeSm,
            fontWeight: AppFonts.bold,
            color: Colors.black54,
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: _getStatusColor(state.status),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            _statusText(state.status),
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: AppFonts.fontSizeSm,
              fontWeight: AppFonts.bold,
              color: AppColors.bg,
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(StudyProfileStatus status) {
    switch (status) {
      case StudyProfileStatus.pending:
        return Colors.yellow;
      case StudyProfileStatus.approved:
        return Colors.green;
      case StudyProfileStatus.rejected:
        return Colors.red;
      default:
        return Colors.grey; // For draft
    }
  }

  String _statusText(StudyProfileStatus status) {
    switch (status) {
      case StudyProfileStatus.draft:
        return 'Dự thảo';
      case StudyProfileStatus.pending:
        return 'Chờ phê duyệt';
      case StudyProfileStatus.approved:
        return 'Phê duyệt';
      case StudyProfileStatus.rejected:
        return 'Từ chối';
      default:
        return 'Không xác định';
    }
  }

  void _showConfirmationDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: 'Thông báo',
      desc: 'Bạn có chắc chắn muốn xác nhận?',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        context.read<StudyProfileBloc>().add(SubmitProfileEvent());
      },
    ).show();
  }
}
