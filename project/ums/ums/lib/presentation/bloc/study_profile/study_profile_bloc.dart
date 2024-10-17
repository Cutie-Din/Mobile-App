import 'package:flutter_bloc/flutter_bloc.dart';
import 'study_profile_event.dart';
import 'study_profile_state.dart';

class StudyProfileBloc extends Bloc<StudyProfileEvent, StudyProfileState> {
  StudyProfileBloc() : super(StudyProfileState.initial()) {
    on<PickImageEvent>((event, emit) {
      final updatedImagePaths = List<String?>.from(state.imagePaths);
      updatedImagePaths[event.index] = event.imagePath;
      emit(state.copyWith(imagePaths: updatedImagePaths));
    });

    on<SelectCityEvent>((event, emit) {
      emit(state.copyWith(selectedCity: event.city));
    });

    on<SelectSchoolEvent>((event, emit) {
      emit(state.copyWith(selectedSchool: event.school));
    });

    on<SubmitProfileEvent>((event, emit) {
      print("SubmitProfileEvent triggered");
      print("Current image paths: ${state.imagePaths}");
      print("Selected city: ${state.selectedCity}");
      print("Selected school: ${state.selectedSchool}");

      // Check conditions
      if (state.imagePaths.where((image) => image != null).length == 6 &&
          state.selectedCity != null &&
          state.selectedSchool != null) {
        emit(state.copyWith(status: StudyProfileStatus.pending));
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(status: StudyProfileStatus.approved));
        });
      } else {
        emit(state.copyWith(status: StudyProfileStatus.rejected));
        print("Conditions not met: changing status to rejected"); // Debug statement
      }
    });
  }
}
