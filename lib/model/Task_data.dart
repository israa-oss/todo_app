import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Buy Milk'),
    Task(title: 'Buy bread'),
    Task(title: 'Buy bicycle'),
  ];
  int get count {
    return _tasks.length;
  }

  void toggle(Task task) {
    task.toggleTask();
    notifyListeners();
  }

  List<Task> tasks() => UnmodifiableListView(_tasks);

  void addTask(String newTask) {
    _tasks.add(Task(title: newTask));
    notifyListeners();
  }

  // void updateTask(index, String updateTask) {
  //   bool isActive = tasks[index].isDone;
  //   tasks[index] = Task(title: updateTask, isDone: isActive);
  //   notifyListeners();
  // }

  void delete(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
