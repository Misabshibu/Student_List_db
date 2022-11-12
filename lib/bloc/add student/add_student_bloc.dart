import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../functions/student_functions.dart';

part 'add_student_event.dart';
part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  AddStudentBloc() : super(InitialState()) {
    on<AddImage>((event, emit) async {
      log('called');

      String studentImage = await Functions.pickImage();
      log('message after');
      log(studentImage.toString());
      emit(AddStudentState(imgPath: studentImage));
    });

    on<AddStudent>((event, emit) {
      final Student = Functions.onAddStudentButtonClicked(
          name: event.name,
          age: event.age,
          qualification: event.qualification,
          place: event.place,
          imagePath: state.imgPath,
          gender: event.gender);

      if (Student == null) {
        return;
      } else {
        Functions.addStudent(value: Student);
        state.imgPath = 'assets/images/image_null.jpg';
      }
    });
  }
}
