import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
// import 'package:taskapp_v2/models/task.dart';
import '../controllers/task_controller.dart';
import '../screens/task_detail_screen.dart';
import 'tasklist.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget(
      {required this.index,
      required this.taskName,
      required this.subTitle,
      // required this.taskCompleted,
      this.onchanged,
      this.onDelete,
      this.onEdit,
      super.key, required bool taskCompleted});

  final int index;

  final String taskName, subTitle;
  // final bool taskCompleted;
  final Function(bool?)? onchanged;
  final Function(BuildContext)? onDelete;
  final Function(BuildContext)? onEdit;

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();
    final task = taskController.tasks[index];
    return GestureDetector(
      onTap: () {
        Get.to(() => TaskDetailScreen(index: index));
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 14.0,
            right: 14.0,
            top: 10.0,
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: onDelete,
                  icon: Icons.delete,
                  backgroundColor: const Color(0xFF6C63FF),
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(50)),
                  foregroundColor: Colors.white,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: onEdit,
                  icon: Icons.edit,
                  backgroundColor: const Color(0xFF6C63FF),
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(50)),
                ),
              ],
            ),
            child: TaskList(
              // taskCompleted: taskCompleted,
              taskController: taskController,
              index: index,
              task: task,
            ),
          ),
        ),
      ),
    );
  }
}
