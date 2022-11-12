import 'dart:developer';

import 'package:image_picker/image_picker.dart';

import '../models/student_model.dart';
import 'boxes.dart';

class Functions {
// ImagePicker? _imagePicker;
// final ImagePicker _picker = ImagePicker();

  static addStudent({required StudentModel value}) {
    final box = Boxes.getRecord();
    box.add(value);
  }

  //*************************** */
  static onAddStudentButtonClicked(
      {required String name,
      required String age,
      required String qualification,
      required String place,
      required String imagePath,
      required String gender}) {
    if (name == null ||
        name.trim() == '' ||
        age == null ||
        age.trim() == '' ||
        qualification == null ||
        qualification.trim() == '' ||
        place == null ||
        place.trim() == '') {
      return null;
    } else {
      final student = StudentModel(
          name: name,
          age: age,
          qualification: qualification,
          place: place,
          imagepath: imagePath,
          gender: gender);
      return student;
    }
  }

  //************************** */
  static searchStudent({required String searchString}) {
    final box = Boxes.getRecord();
    final studentData = box.values.toList();
    List<StudentModel> filteredList = [];
    for (StudentModel temp in studentData) {
      if (temp.name.toUpperCase().contains(searchString.toUpperCase())) {
        filteredList.add(temp);
      }
    }

    return filteredList;
  }

  //************************************* */

  static getStudentData() {
    final allData = Boxes.getRecord();
    final student_data = allData.values.toList().cast<StudentModel>();
    return student_data;
  }

  //********************* *********/

  static removeStudent({required int id}) async {
    final box = Boxes.getRecord();
    await box.delete(id);
  }

  //***************************** */
  static editStudent(
      {required int id,
      required String name,
      required String age,
      required String qualification,
      required String place,
      required String imagepath,
      required String gender}) {
    final student = StudentModel(
        name: name,
        age: age,
        qualification: qualification,
        place: place,
        imagepath: imagepath,
        gender: gender);

    final box = Boxes.getRecord();
    box.put(id, student);
  }

  //************************ */

  static pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = image.path;
    // log(imageTemp.toString());

    return imageTemp;
  }
}
