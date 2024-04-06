import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final text;
  final border;
  final maxlines;
  final bool autoFocus;
  final Controller;

  const MyTextField({
    super.key,
    required this.text,
    this.border,
    this.maxlines,
    required this.autoFocus,
    required this.Controller
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Controller,
      autofocus: autoFocus,
      maxLines: maxlines,
      decoration: InputDecoration(
        labelText: text,
        border: border,
      ),
    );
  }
}