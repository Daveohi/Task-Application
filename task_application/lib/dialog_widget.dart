import 'package:flutter/material.dart';
import 'package:task_application/dialog_button.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {required this.onCancelButton,
      required this.onSave,
      required this.taskController,
      required this.subtitleController,
      super.key});

  final VoidCallback onSave, onCancelButton;
  final TextEditingController taskController, subtitleController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // contentPadding: const EdgeInsets.all(16.0),
      content: SizedBox(
        height: 180,
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Create Task'),
            ),
            TextField(
              controller: subtitleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Subtitle'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogButton(
                  text: 'Save',
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                DialogButton(
                  text: 'Cancel',
                  onPressed: onCancelButton,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
