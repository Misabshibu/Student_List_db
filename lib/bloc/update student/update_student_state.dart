part of 'update_student_bloc.dart';

@immutable
class UpdateStudentState {
  final StudentModel student;

  UpdateStudentState({required this.student});
}

class InitialState extends UpdateStudentState {
  InitialState() : super(student: temp);
}

StudentModel temp = StudentModel(
    name: '',
    age: '',
    qualification: '',
    place: '',
    imagepath: 'assets/images/image_null.jpg',
    gender: '');
