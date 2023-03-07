import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/Task_data.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskData>(context).tasks();
    return ListView.builder(
        itemCount: Provider.of<TaskData>(context).count,
        itemBuilder: (context, index) {
          return TaskTile(
            task: tasks[index],
          );
        });
  }
}
