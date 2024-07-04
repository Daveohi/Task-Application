import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../controllers/task_controller.dart';
import '../widgets/dialog_widget.dart';
import '../widgets/task_widget.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key, required String fullName});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final TaskController taskController = Get.put(TaskController());
  final TextEditingController taskControllerText = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();

  void cancelTask() {
    Navigator.pop(context);
  }

  // void taskCompleted(int index) {
  //   setState(() {
  //     taskController.tasks[index].isCompleted =
  //         !taskController.tasks[index].isCompleted;
  //   });
  // }

  void saveNewTask() {
    setState(() {
      taskController.addTask(taskControllerText.text, subtitleController.text);
      taskControllerText.clear();
      subtitleController.clear();
    });
    Navigator.pop(context);
  }

  void createNewTask() {
    taskControllerText.text = '';
    subtitleController.text = '';
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          taskController: taskControllerText,
          subtitleController: subtitleController,
          onSave: saveNewTask,
          onCancelButton: cancelTask,
        );
      },
    );
  }

  void editTask(int index) {
    taskControllerText.text = taskController.tasks[index].title;
    subtitleController.text = taskController.tasks[index].description;

    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          taskController: taskControllerText,
          subtitleController: subtitleController,
          onSave: () {
            setState(() {
              taskController.updateTask(
                  index, taskControllerText.text, subtitleController.text);
            });
            Navigator.pop(context);
          },
          onCancelButton: cancelTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.description_outlined),
            backgroundColor: const Color(0xFF6C63FF),
            foregroundColor: Colors.white,
            label: 'Crear proyecto',
            labelBackgroundColor: Colors.white,
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () {
              // Add functionality for creating project
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.add_task_rounded),
            backgroundColor: const Color(0xFF6C63FF),
            foregroundColor: Colors.white,
            label: 'Create Task',
            labelBackgroundColor: Colors.white,
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () {
              createNewTask();
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xfafafafa),
      body: Obx(() {
        return
        Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 220.0),
              child: ListView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.manual,
                shrinkWrap: true,
                itemCount: taskController.tasks.length,
                itemBuilder: (context, index) {
                  return TaskWidget(
                    index: index,
                    taskName: taskController.tasks[index].title,
                    subTitle: taskController.tasks[index].description,
                    taskCompleted: taskController.tasks[index].isCompleted,
                    onchanged: (value) =>
                        taskController.toggleTaskStatus(index),
                    onDelete: (context) {
                      setState(() {
                        taskController.deleteTask(index);
                      });
                    },
                    onEdit: (context) {
                      editTask(index);
                    },
                    // index: index,
                  );
                },
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 4,
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                          left: 14.0, top: 10.0, bottom: 15.0),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: double.infinity,
                          maxHeight: 150,
                        ),
                        padding: const EdgeInsets.all(16),
                        width: (MediaQuery.of(context).size.width / 2) - 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              CupertinoIcons.gift_fill,
                              color: Colors.red,
                              size: 30,
                              shadows: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                  spreadRadius: 5.0,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 1.0, top: 20.0, right: 40, bottom: 3.0),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'No. of Tasks \n',
                                      style: TextStyle(
                                        color: Colors.black38,
                                      ),
                                    ),
                                    TextSpan(
                                      text: taskController.tasks.length
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                          right: 14.0, top: 10.0, bottom: 15.0),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: double.infinity,
                          maxHeight: 150,
                        ),
                        padding: const EdgeInsets.all(16),
                        width: (MediaQuery.of(context).size.width / 2) - 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              CupertinoIcons.headphones,
                              color: Colors.red,
                              size: 30,
                              shadows: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                  spreadRadius: 5.0,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 1.0, top: 20.0, right: 40, bottom: 3.0),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Task Completed \n',
                                      style: TextStyle(
                                        color: Colors.black38,
                                      ),
                                    ),
                                    TextSpan(
                                      text: taskController.completedTasks
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 2),
                        DotsIndicator(
                          position: 0,
                          dotsCount: 1,
                          decorator: const DotsDecorator(),
                        ),
                        const Text(
                          'Task of the day',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '                                       Swipe left to delete/edit task',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
