import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:task_application/card.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget(
      {required this.taskName,
      required this.subTitle,
      required this.taskCompleted,
      this.onchanged,
      this.onDelete,
      this.onEdit,
      super.key});

  final String taskName, subTitle;
  final bool taskCompleted;
  final Function(bool?)? onchanged;
  final Function(BuildContext)? onDelete;
  final Function(BuildContext)? onEdit;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50)),
                foregroundColor: Colors.white,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: onEdit,
                icon: Icons.edit,
                backgroundColor: const Color(0xFF6C63FF),
                borderRadius: const BorderRadius.only(topRight: Radius.circular(50)),),
            ],
          ),
          
          child: Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            child: ListTile(
              hoverColor: Colors.blue,
              leading: Radio(
                value: taskCompleted,
                onChanged: onchanged,
                activeColor: Colors.black,
                groupValue: true,
              ),
              
              title: Text(
               taskName,
                style: const TextStyle(color: Colors.black54, fontSize: 10),
              ),
              
              subtitle: Text(subTitle, textAlign: 
              TextAlign.left, ),
            ),
          ),
        ),
      ),
    );
  }
}


