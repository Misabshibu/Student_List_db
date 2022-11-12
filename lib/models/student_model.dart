import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String age;

  @HiveField(2)
  String qualification;

  @HiveField(3)
  String place;

  @HiveField(4)
  String imagepath;

  @HiveField(5)
  String gender;

  StudentModel(
      {required this.name,
      required this.age,
      required this.qualification,
      required this.place,
      required this.imagepath,
      required this.gender});
}
