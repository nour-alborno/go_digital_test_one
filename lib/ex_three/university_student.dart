import 'package:go_digital_test_one/ex_three/student.dart';

class UniversityStudent extends Student{
  UniversityStudent.name(super.student, super.id, super.level, super.courses) : super.name();

  @override
  double calculateGPA() {


    double sum = 0;
    double hours = 0;

    courses?.forEach((element) {
      sum +=element.grade! * element.hours!;
      hours += element.hours!;
    });
    double? gpa  = sum / hours ;

    return gpa;
  }
  }

