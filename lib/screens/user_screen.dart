import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditaion_app/screens/app_drawer.dart';
import 'package:meditaion_app/widgets/textbox.dart';

import '../utils/colors.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Container(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/iron_man.jpg',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextBox(
                text: 'Tony Stark', icon: Icons.person, enable: _isEnabled),
            const SizedBox(
              height: 20,
            ),
            CustomTextBox(
                text: 'tonystark@gmail.com',
                icon: Icons.email,
                enable: _isEnabled),
            const SizedBox(
              height: 20,
            ),
            CustomTextBox(
                text: 'Engineer', icon: Icons.work, enable: _isEnabled),
            const SizedBox(
              height: 20,
            ),
            CustomTextBox(
                text: '+221 123456789', icon: Icons.call, enable: _isEnabled), const SizedBox(
              height: 20,
            ),

            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  _isEnabled = !_isEnabled;
                });
              },
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color.fromRGBO(177, 175, 255, 100),
                ),
                child: Center(
                    child: Text(
                  _isEnabled ? "Disable" : "Edit",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
