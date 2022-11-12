import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_picker/source/enums.dart';
import '../home%20screen/screen_home.dart';

import '../../bloc/add%20student/add_student_bloc.dart';
import '../../widgets/gender_selector.dart';
import '../../widgets/image_add_edit.dart';
import '../../widgets/text_field.dart';

String gendercontroller = 'Gender.Male';

class ScreenAddStudent extends StatelessWidget {
  ScreenAddStudent({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<AddStudentBloc, AddStudentState>(
          builder: (context, state) {
            return Column(
              children: [
                ImageAddAndEdit(
                  funcImage: () {
                    context.read<AddStudentBloc>().add(AddImage());
                  },
                  imgstudent: state.imgPath != 'assets/images/image_null.jpg'
                      ? Image.file(File(state.imgPath)).image
                      : AssetImage(state.imgPath),
                  size: size,
                  titel: 'Add Student',
                  saveFunction: () {
                    context.read<AddStudentBloc>().add(AddStudent(
                        name: nameController.text,
                        age: ageController.text,
                        qualification: qualificationController.text,
                        place: placeController.text,
                        gender: gendercontroller.toString()));

                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ScreenHome()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Textfield(
                        textController: nameController,
                        text: 'Name',
                        iconprefix: const Icon(Icons.abc),
                      ),
                      Textfield(
                        textController: ageController,
                        keyboardType: TextInputType.number,
                        text: 'Age',
                        textLimit: 2,
                        iconprefix: const Icon(Icons.numbers),
                      ),
                      Textfield(
                        textController: qualificationController,
                        text: 'Qualification',
                        iconprefix: const Icon(Icons.school),
                      ),
                      Textfield(
                        textController: placeController,
                        text: 'Place',
                        iconprefix: const Icon(Icons.location_on),
                      ),
                      SizedBox(
                        height: size.width * 0.04,
                      ),
                      GenderSelector(
                        genderFunc: (Gender? gender) {
                          gendercontroller = gender.toString();
                        },
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
