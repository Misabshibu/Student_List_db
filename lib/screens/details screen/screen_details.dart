import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/add%20student/add_student_bloc.dart';
import '../../models/student_model.dart';

import '../details%20screen/widgets/details_gender.dart';
import '../details%20screen/widgets/details_image.dart';
import '../details%20screen/widgets/details_textfield.dart';

class ScreenDetails extends StatelessWidget {
  ScreenDetails({super.key, required this.data, required this.index});
  final StudentModel data;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<AddStudentBloc, AddStudentState>(
        builder: (context, state) {
          return Column(
            children: [
              DetailsImage(
                data: data,
                size: size,
                index: index,
                imagepath: data.imagepath,
              ),
              const SizedBox(
                height: 10,
              ),
              DetailsTextfield(
                text: data.age,
                size: size,
                name: 'Age',
              ),
              const SizedBox(
                height: 15,
              ),
              DetailsTextfield(
                  text: data.qualification, size: size, name: 'Qualification'),
              const SizedBox(
                height: 15,
              ),
              DetailsTextfield(text: data.place, size: size, name: 'Place'),
              const SizedBox(
                height: 15,
              ),
              DetailsGender(
                gender: data.gender,
              )
            ],
          );
        },
      ),
    );
  }
}
