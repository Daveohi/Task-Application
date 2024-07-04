import 'package:get/get.dart';
import 'package:task_application/models/task.dart';
// import 'package:taskapp_v2/models/task.dart';


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
    var task = tasks[index];
    task.isCompleted = !task.isCompleted;
    tasks[index] = task;
  }

  int get completedTasks => tasks.where((task) => task.isCompleted).length;
}
