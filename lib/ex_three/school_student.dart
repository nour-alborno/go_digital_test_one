import 'package:go_digital_test_one/ex_three/student.dart';

class SchoolStudent extends Student{
  SchoolStudent.name(super.student, super.id, super.level, super.courses) : super.name();

  @override
  double calculateGPA() {
    double sum = 0;
    double hours = 0;

    courses?.forEach((element) {
      sum +=element.grade!;
      hours += element.hours!;
    });
     double? gpa  = sum / courses!.length ;
    return gpa;
  }

}