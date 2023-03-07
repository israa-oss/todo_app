import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/Task_data.dart';

import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTask = '';
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Add Task',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.lightBlueAccent, fontSize: 24),
                    ),
                    TextField(
                      onChanged: (value) {
                        newTask = value;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<TaskData>(context, listen: false)
                            .addTask(newTask);
                        Navigator.pop(context);
                      },
                      child: const Text('ADD'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 24, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 32,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'To Do',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 54,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${Provider.of<TaskData>(context).count} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
