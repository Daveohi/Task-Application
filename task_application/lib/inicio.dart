import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:task_application/dialog_widget.dart';
import 'package:task_application/task_widget.dart';

class Inicio extends StatefulWidget {
  const Inicio(
      {
      // required this.onUpdateTotalTasks,
      // required this.onUpdateCompletedTasks,
      super.key});

  // final ValueChanged<int> onUpdateTotalTasks, onUpdateCompletedTasks;
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  List taskList = [
    ['E-Learning App', 'Diseño de Onboarding', false],
    ['Car Rental Website', 'Landing Page', false],
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      // _updateTaskCounts();
    });
  }

  // void _updateTaskCounts() {
  //   widget.onUpdateTotalTasks(taskList.length);
  //   widget.onUpdateCompletedTasks(
  //       taskList.where((taskList) => taskList[2]).length);
  // }

  void cancelTask() {
    Navigator.pop(context);
  }

  void taskCompleted(bool? value, int index) {
    setState(() {
      taskList[index][2] = !taskList[index][2];
      WidgetsBinding.instance.addPersistentFrameCallback((_) {
        // _updateTaskCounts();
      });
    });
  }

  void saveNewTask() {
    setState(() {
      taskList.add([taskController.text, subtitleController.text, false]);
      taskController.clear();
      subtitleController.clear();
      WidgetsBinding.instance.addPersistentFrameCallback((_) {
        // _updateTaskCounts();
      });
    });
    Navigator.pop(context);
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          taskController: taskController,
          subtitleController: subtitleController,
          onSave: saveNewTask,
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
            label: 'Crear tarea',
            labelBackgroundColor: Colors.white,
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () {
              createNewTask();
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xfafafafa),
      body: SingleChildScrollView(
        child: Column(
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
                                  text: 'Nuevas toreas \n',
                                  style: TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                                TextSpan(
                                  text: '0',
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
                                  text: 'Proyectos \n',
                                  style: TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                                TextSpan(
                                  text: '0',
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
                    const SizedBox(width: 4),
                    DotsIndicator(
                      position: 0,
                      dotsCount: 1,
                      decorator: const DotsDecorator(),
                    ),
                    const Text(
                      'Tareas del dia',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  
                  child: ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.manual,
                    shrinkWrap: true,
                    itemCount: taskList.length,
                    itemBuilder: (context, index) {
                      return TaskWidget(
                        taskName: taskList[index][0],
                        subTitle: taskList[index][1],
                        taskCompleted: taskList[index][2],
                        onchanged: (value) => taskCompleted(value, index),
                        onDelete: (context) {
                          setState(() {
                            taskList.removeAt(index);
                            // WidgetsBinding.instance.addPersistentFrameCallback((_) {
                            //   _updateTaskCounts();
                            // });
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      //  Padding(
      //   padding: const EdgeInsets.all(8.0),
    );
  }
}
