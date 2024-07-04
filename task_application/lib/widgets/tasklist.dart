import 'package:flutter/material.dart';
import '../controllers/task_controller.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskController,
    required this.index,
    required this.task,
  });

  final TaskController taskController;
  final int index;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.0),
      clipBehavior: Clip.antiAlias,
      color: Colors.blueGrey[400],
      // child: Obx(() {
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Checkbox.adaptive(
            value: task.isCompleted,
            onChanged: (value) {
              taskController.toggleTaskStatus(index);
            },
            activeColor: Colors.black,
            // groupValue: true,
          ),
          title: Text(
            task.title,
            style: const TextStyle(color: Colors.black54, fontSize: 20),
          ),
          subtitle: Text(
            task.description,
            textAlign: TextAlign.left,)
          ),
      ),
      // }),
    );
  }
}
