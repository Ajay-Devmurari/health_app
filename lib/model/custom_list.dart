import 'package:flutter/material.dart';

class CustomList {
  final Color bgColor;
  final String imageData;
  final String text;
  final Color? iconColor;

  CustomList(
      {required this.bgColor,
      required this.imageData,
      required this.text,
      this.iconColor});
}
