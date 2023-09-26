import 'package:flutter/material.dart';
import 'package:go_digital_test_one/tab_bar_example/dataProvider.dart';
import 'package:go_digital_test_one/tab_bar_example/task_model.dart';
import 'package:provider/provider.dart';



class CompletedTasks extends StatelessWidget {
  const CompletedTasks({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: Provider.of<DataProvider>(context).tasksData.where((element) => element.isComplete ).toList().length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.blue,
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceAround,
            children: [
               Text("${ Provider.of<DataProvider>(context).tasksData.where((element) => element.isComplete ).toList()[index].title }"),
              Checkbox(

                value:  Provider.of<DataProvider>(context).tasksData.where((element) => element.isComplete ).toList()[index].isComplete  , onChanged: (value) {
                Provider.of<DataProvider>(context,listen: false).toggelTask(Provider.of<DataProvider>(context).tasksData.where((element) => element.isComplete ).toList()[index]);
              },)
            ],
          ),

        );
      },

    );
  }
}
