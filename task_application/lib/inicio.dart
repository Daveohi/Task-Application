import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:task_application/dialog_widget.dart';
import 'package:task_application/task_widget.dart';

class Inicio extends StatefulWidget {
  const Inicio(
      {required this.onUpdateTotalTasks,
      required this.onUpdateCompletedTasks,
      super.key});

  final ValueChanged<int> onUpdateTotalTasks, onUpdateCompletedTasks;
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
      _updateTaskCounts();
    });
  }

  void _updateTaskCounts() {
    widget.onUpdateTotalTasks(taskList.length);
    widget.onUpdateCompletedTasks(
        taskList.where((taskList) => taskList[2]).length);
  }

  void cancelTask() {
    Navigator.pop(context);
  }

  void taskCompleted(bool? value, int index) {
    setState(() {
      taskList[index][2] = !taskList[index][2];
      WidgetsBinding.instance.addPersistentFrameCallback((_) {
        _updateTaskCounts();
      });
    });
  }

  void saveNewTask() {
    setState(() {
      taskList.add([taskController.text, subtitleController.text, false]);
      taskController.clear();
      subtitleController.clear();
      WidgetsBinding.instance.addPersistentFrameCallback((_) {
        _updateTaskCounts();
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

  bool _isFabExtended = false;

  void _toggleFab() {
    setState(() {
      _isFabExtended = !_isFabExtended;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfafafafa),
      floatingActionButton: _isFabExtended
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  backgroundColor: const Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    createNewTask();
                    // Add your onPressed code here!
                  },
                  foregroundColor: Colors.white,
                  icon: const Icon(Icons.add_task_rounded),
                  label: const Text('Crear tarea'),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.extended(
                  backgroundColor: const Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  foregroundColor: Colors.white,
                  icon: const Icon(
                    Icons.description_rounded,
                  ),
                  label: const Text('Crear proyecto'),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  backgroundColor: const Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: _toggleFab,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.close),
                ),
              ],
            )
          : FloatingActionButton(
              backgroundColor: const Color(0xFF6C63FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: _toggleFab,
              foregroundColor: Colors.white,
              child: const Icon(Icons.add),
            ),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 4),
              DotsIndicator(
                dotsCount: 1,
                position: 0,
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
          Flexible(
            child: ListView.builder(
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
                      WidgetsBinding.instance.addPersistentFrameCallback((_) {
                        _updateTaskCounts();
                      });
                    });
                  },
                );
              },
            ),
          ),
          // }),
        ],
      ),
    );
  }
}
