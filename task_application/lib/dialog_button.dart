import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    required this.text,
    this.onPressed,
    super.key});

    final String text;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColorLight,
      child: Text(text),
    );
  }
}