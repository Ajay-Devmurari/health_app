import 'package:flutter/material.dart';

class CustomTextBox extends StatefulWidget {
  const CustomTextBox(
      {super.key,
      required this.text,
      required this.icon,
      required this.enable});

  final String text;
  final IconData icon;
  final bool enable;

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: widget.enable,
        decoration: InputDecoration(
          hintText: widget.text,
          suffixIcon: Icon(widget.icon),
          border: const OutlineInputBorder(),
        ));
  }
}
