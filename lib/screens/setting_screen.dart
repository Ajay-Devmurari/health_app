import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditaion_app/screens/app_drawer.dart';
import 'package:meditaion_app/screens/home_screen.dart';

import '../utils/colors.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: SizedBox(
              // width: wd * 0.03,
              height: ht * 0.03,
              child: SvgPicture.asset(
                'assets/hamburger_icon.svg',
                fit: BoxFit.cover,
                color: CustomColor.iconColor,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: Center(
          child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        },
        child: const Text('Logout', style: TextStyle(fontSize: 24)),
      )),
    );
  }
}
