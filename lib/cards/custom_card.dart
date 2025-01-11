import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditaion_app/utils/colors.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
      {super.key,
      required this.bgColor,
      required this.title,
      required this.onTap,
      required this.subtitle,
      required this.linkText,
      required this.image,
      required this.icon,
      required this.iconColor});

  final Color bgColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String linkText;
  final String image;
  final IconData icon;
  final Color iconColor;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.sizeOf(context).height;
    final double wd = MediaQuery.sizeOf(context).width;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(25),
        ),
        height: ht * 0.22,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      color: CustomColor.textColor,
                      fontSize: wd * 0.06,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                      color: CustomColor.textColor,
                      fontSize: wd * 0.03,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      widget.linkText,
                      style: TextStyle(
                          color: CustomColor.textColor,
                          fontSize: wd * 0.05,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(width: wd * 0.02),
                    Icon(
                      widget.icon,
                      size: ht * 0.038,
                      color: widget.iconColor,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
                top: 40,
                right: 10,
                child: SvgPicture.asset(
                  widget.image,
                  height: ht * 0.10,
                  width: wd * 0.10,
                  fit: BoxFit.cover,
                )),
          ],
        ),
      ),
    );
  }
}
