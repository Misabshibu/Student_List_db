import 'package:hive/hive.dart';

import '../models/student_model.dart';

class Boxes {
  static Box<StudentModel> getRecord() => Hive.box<StudentModel>('student_db');
}
