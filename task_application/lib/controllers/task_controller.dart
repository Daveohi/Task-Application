

import 'package:get/get.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  void addTask(String title, String description) {
    tasks.add(Task(
      title: title,
      description: description,
      creationDate: DateTime.now(),
    ));
  }

  void updateTask(int index, String title, String description) {
    var task = tasks[index];
    task.title = title;
    task.description = description;
    tasks[index] = task;
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }

  void toggleTaskStatus(int index) {
    // tasks[index].isCompleted = !tasks[index].isCompleted;
    // tasks.refresh();
    var task = tasks[index];
    task.isCompleted = !task.isCompleted;
    tasks[index] = task;
  }

  void taskCompleted(bool? value, int index) {
    var task = tasks[index];
    task.isCompleted = !task.isCompleted;
    tasks[index] = task;
  }
  bool isTaskCompleted(int index) {
    return tasks[index].completed;
  }

  int get completedTasks => tasks.where((task) => task.isCompleted).length;
}
