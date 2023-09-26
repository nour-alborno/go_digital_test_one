import 'package:flutter/material.dart';
import 'package:go_digital_test_one/tab_bar_example/dataProvider.dart';
import 'package:go_digital_test_one/tab_bar_example/task_model.dart';
import 'package:provider/provider.dart';



class InCompletedTasks extends StatelessWidget {
  const InCompletedTasks({super.key});



  @override
  Widget build(BuildContext context) {
    List<Task> t =  Provider.of<DataProvider>(context).tasksData.where((element) => element.isComplete  == false).toList();
    return ListView.builder(
      itemCount:  t.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceAround,
            children: [
              Text(t[index].title ?? ""),
              Checkbox(value:  t[index].isComplete , onChanged: (value) {

                Provider.of<DataProvider>(context,listen: false).toggelTask( t[index]);

              },)
            ],
          ),

        );
      },

    );
  }
}
