


import 'package:flutter/material.dart';
import 'package:go_digital_test_one/tab_bar_example/task_model.dart';


class DataProvider extends ChangeNotifier {
  List <Task> tasksData = [
    Task(title: "Prayer"),
    Task(title: "lunch"),
    Task(title: "studying"),
    Task(title: "calling mum"),

  ];

  toggelTask(Task task){
   task.isComplete = !task.isComplete;
   notifyListeners();
  }
}