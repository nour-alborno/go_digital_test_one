import 'package:flutter/material.dart';
import 'package:go_digital_test_one/tab_bar_example/screens/all_tasks_screen.dart';
import 'package:go_digital_test_one/tab_bar_example/screens/completed_tasks.dart';
import 'package:go_digital_test_one/tab_bar_example/screens/incompleted_task.dart';





class MainTabBarPage extends StatelessWidget {
  const MainTabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar Example"),
          bottom: TabBar(
              tabs:[
                Tab(icon: Icon(Icons.task),text: "Tasks" ,),
                Tab(icon: Icon(Icons.task_alt),text: "Completed" ,),
                Tab(icon: Icon(Icons.remove_circle_outline),text: "Incompleted" ,),

              ] )),

        body: TabBarView(
            children: [
              AllTasksScreen(),
              CompletedTasks(),
              InCompletedTasks(),
            ]),

      ),
    );
  }
}
