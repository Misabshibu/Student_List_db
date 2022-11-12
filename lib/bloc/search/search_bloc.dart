import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../functions/student_functions.dart';
import '../../models/student_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState()) {
    on<SearchEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SearchStudent>((event, emit) {
      log(event.searchString.toString());
      if (event.searchString.isEmpty) {
        List<StudentModel> student = Functions.getStudentData();
        emit(SearchState(studentsList: student));
      }

      List<StudentModel> studentData =
          Functions.searchStudent(searchString: event.searchString);
      emit(SearchState(studentsList: studentData));
    });

    on<RemoveStudent>((event, emit) {
      Functions.removeStudent(id: event.id);
      emit(state);
    });
  }
}
