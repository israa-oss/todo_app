import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo_app/model/Task_data.dart';

import '../model/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        Alert(
          context: context,
          desc: "Are You Sure You want to delete ths Task",
          buttons: [
            DialogButton(
              color: Colors.green,
              child: Text(
                "Yes",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).delete(task);
                Navigator.pop(context);
              },
              width: 150,
            ),
            DialogButton(
              color: Colors.red,
              child: Text(
                "No",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              width: 150,
            )
          ],
        ).show();
      },
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: MyCheckbox(
        isChecked: task.isDone,
        func: (bool? value) {
          Provider.of<TaskData>(context, listen: false).toggle(task);
        },
      ),
    );
  }
}

class MyCheckbox extends StatelessWidget {
  const MyCheckbox({
    Key? key,
    required this.isChecked,
    this.func,
  }) : super(key: key);

  final bool isChecked;
  final Function(bool?)? func;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: func,
    );
  }
}
