import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../functions/student_functions.dart';
import '../../models/student_model.dart';

part 'update_student_event.dart';
part 'update_student_state.dart';

class UpdateStudentBloc extends Bloc<UpdateStudentEvent, UpdateStudentState> {
  UpdateStudentBloc() : super(InitialState()) {
    on<UpdateStudentEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<CallStudentData>((event, emit) {
      final List<StudentModel> studentData = Functions.getStudentData();
      emit(UpdateStudentState(student: studentData[event.index]));
    });

    on<SaveChanges>((event, emit) {
      Functions.editStudent(
          id: event.id,
          name: event.name,
          age: event.age,
          qualification: event.qualification,
          place: event.place,
          imagepath: event.imagePath,
          gender: event.gender);
    });

    on<EditImage>((event, emit) async {
      String studentImage = await Functions.pickImage();
      emit(state);
      state.student.imagepath = studentImage; //*********888 */
      emit(state);
    });
  }
}
