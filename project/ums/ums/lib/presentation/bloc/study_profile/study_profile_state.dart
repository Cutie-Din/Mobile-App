class StudyProfileState {
  final List<String?> imagePaths;
  final String? selectedCity;
  final String? selectedSchool;
  final StudyProfileStatus status;

  StudyProfileState({
    required this.imagePaths,
    required this.selectedCity,
    required this.selectedSchool,
    required this.status,
  });

  factory StudyProfileState.initial() {
    return StudyProfileState(
      imagePaths: List.generate(6, (index) => null),
      selectedCity: null,
      selectedSchool: null,
      status: StudyProfileStatus.draft,
    );
  }

  StudyProfileState copyWith({
    List<String?>? imagePaths,
    String? selectedCity,
    String? selectedSchool,
    StudyProfileStatus? status,
  }) {
    return StudyProfileState(
      imagePaths: imagePaths ?? this.imagePaths,
      selectedCity: selectedCity ?? this.selectedCity,
      selectedSchool: selectedSchool ?? this.selectedSchool,
      status: status ?? this.status,
    );
  }
}

enum StudyProfileStatus {
  draft,
  pending,
  approved,
  rejected,
}
