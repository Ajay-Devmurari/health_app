import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.bgColor,
      required this.fontColor,
      required this.onTap,
      required this.text});

  final String text;
  final Color bgColor;
  final Color fontColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 25, color: fontColor),
          ),
        ),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
