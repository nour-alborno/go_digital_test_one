import 'package:go_digital_test_one/ex_three/course.dart';
import 'package:go_digital_test_one/ex_three/enum_level.dart';



abstract class  Student {
  String? student;
  int? id;
  Level? level;
  List<Course>? courses;

  double calculateGPA();

  Student.name(this.student, this.id, this.level, this.courses);
}