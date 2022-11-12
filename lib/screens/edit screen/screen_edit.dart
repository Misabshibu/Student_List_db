import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:students_list/screens/home%20screen/screen_home.dart';
import '../add%20student%20screen/screen_add_student.dart';
import '../../bloc/add%20student/add_student_bloc.dart';
import '../../bloc/update%20student/update_student_bloc.dart';
import '../../models/student_model.dart';

import '../../widgets/gender_selector.dart';
import '../../widgets/image_add_edit.dart';
import '../../widgets/text_field.dart';

class ScreenEdit extends StatelessWidget {
  ScreenEdit({super.key, required this.data, required this.index});

  final StudentModel data;
  final int index;

  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController qualificationController = TextEditingController();

  TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = data.name;
    ageController.text = data.age;
    qualificationController.text = data.qualification;
    placeController.text = data.place;
    log('editBuild');
    context.read<UpdateStudentBloc>().add(CallStudentData(index: index));

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<UpdateStudentBloc, UpdateStudentState>(
          builder: (context, state) {
            state.student.imagepath;
            return Column(
              children: [
                ImageAddAndEdit(
                  funcImage: () {
                    context.read<UpdateStudentBloc>().add(EditImage());
                  },
                  imgstudent:
                      state.student.imagepath != 'assets/images/image_null.jpg'
                          ? Image.file(File(state.student.imagepath)).image
                          : AssetImage(state.student.imagepath),
                  saveFunction: () {
                    state.student.name = nameController.text;
                    state.student.age = ageController.text;
                    state.student.qualification = qualificationController.text;
                    state.student.place = placeController.text;

                    // if (nameController.text == '') {
                    //   nameController.text = state.student.name;
                    // } else {
                    //   // state.student.name = nameController.text;
                    // }

                    // if (ageController.text == '') {
                    //   ageController.text = state.student.age;
                    // } else {
                    //   // state.student.age = ageController.text;
                    // }

                    // if (qualificationController.text == '') {
                    //   qualificationController.text =
                    //       state.student.qualification;
                    // } else {
                    //   // state.student.qualification =
                    //   //     qualificationController.text;
                    // }
                    // if (placeController.text == '') {
                    //   placeController.text = state.student.place;
                    // } else {
                    //   // state.student.place = placeController.text;
                    // }
                    // context.read<EditBloc>().add(SaveChanges(
                    //     studentModel: state.student,
                    //     id: state.student.key));
                    BlocProvider.of<UpdateStudentBloc>(context).add(SaveChanges(
                      id: state.student.key,
                      name: state.student.name,
                      age: state.student.age,
                      qualification: state.student.qualification,
                      place: state.student.place,
                      gender: gendercontroller,
                      imagePath: state.student.imagepath,
                    ));
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ScreenHome()));
                  },
                  size: size,
                  titel: 'Edit Student',
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
                        text: 'Age',
                        textLimit: 2,
                        keyboardType: TextInputType.number,
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
                          log(gender.toString());
                          gendercontroller = gender.toString();
                        },
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
