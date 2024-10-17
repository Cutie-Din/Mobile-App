abstract class StudyProfileEvent {}

class PickImageEvent extends StudyProfileEvent {
  final int index;
  final String imagePath;

  PickImageEvent(this.index, this.imagePath);
}

class SelectCityEvent extends StudyProfileEvent {
  final String city;

  SelectCityEvent(this.city);
}

class SelectSchoolEvent extends StudyProfileEvent {
  final String school;

  SelectSchoolEvent(this.school);
}

class SubmitProfileEvent extends StudyProfileEvent {}
