import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditaion_app/buttons/custom_button.dart';
import 'package:meditaion_app/screens/home_screen.dart';

import 'package:meditaion_app/utils/colors.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SvgPicture.asset(
            'assets/bg_image.svg',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 44),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                textAlign: TextAlign.center,
                'It’s Ok Not To Be\nOKAY !!',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              CustomButton(
                  bgColor: CustomColor.bgColor,
                  fontColor: Colors.white,
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const HomeScreen(),
                            type: PageTransitionType.rightToLeft));
                  },
                  text: 'Let Us Help You..')
            ],
          ),
        ),
      ],
    ));
  }
}
