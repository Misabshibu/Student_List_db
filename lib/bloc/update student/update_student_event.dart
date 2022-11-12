part of 'update_student_bloc.dart';

@immutable
abstract class UpdateStudentEvent {}

class CallStudentData extends UpdateStudentEvent {
  int index;
  CallStudentData({required this.index});
}

class EditImage extends UpdateStudentEvent {}

class SaveChanges extends UpdateStudentEvent {
  SaveChanges(
      {required this.id,
      required this.name,
      required this.age,
      required this.qualification,
      required this.place,
      required this.gender,
      required this.imagePath});

  int id;
  String name;
  String age;
  String qualification;
  String place;
  String gender;
  String imagePath;
}
