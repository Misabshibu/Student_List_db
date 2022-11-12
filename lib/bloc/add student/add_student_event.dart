part of 'add_student_bloc.dart';

@immutable
abstract class AddStudentEvent {}

class AddImage extends AddStudentEvent {}

class AddStudent extends AddStudentEvent {
  AddStudent(
      {required this.name,
      required this.age,
      required this.qualification,
      required this.place,
      required this.gender});

  String name;
  String age;
  String qualification;
  String place;
  String gender;
}
