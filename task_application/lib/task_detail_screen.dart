import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/task_controller.dart';

class TaskDetailScreen extends StatelessWidget {
  final int index;

  const TaskDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${taskController.tasks[index].title}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Description: ${taskController.tasks[index].description}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Creation Date: ${taskController.tasks[index].creationDate}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${taskController.tasks[index].isCompleted ? "Completed" : "Incomplete"}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
