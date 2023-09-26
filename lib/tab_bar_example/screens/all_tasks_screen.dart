import 'package:flutter/material.dart';
import 'package:go_digital_test_one/tab_bar_example/dataProvider.dart';
import 'package:go_digital_test_one/tab_bar_example/task_model.dart';
import 'package:provider/provider.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen();


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:  Provider.of<DataProvider>(context).tasksData.length  ,
      itemBuilder: (BuildContext context, int index) {
        return Container(
           color: Provider.of<DataProvider>(context).tasksData[index].isComplete ?  Colors.red : Colors.blue,
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceAround,
            children: [
              Text( Provider.of<DataProvider>(context).tasksData[index].title ?? "" ),
              Checkbox(
                value:  Provider.of<DataProvider>(context).tasksData[index].isComplete ,
                onChanged: (value) {

                  Provider.of<DataProvider>(context,listen: false).toggelTask( Provider.of<DataProvider>(context,listen: false).tasksData[index]);

              },)
            ],
          ),

        );
      },

    );
  }
}
