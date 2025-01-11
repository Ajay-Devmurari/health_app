import 'package:flutter/material.dart';
import 'package:meditaion_app/screens/home_screen.dart';
import 'package:meditaion_app/screens/setting_screen.dart';
import 'package:meditaion_app/screens/user_screen.dart';

import 'music_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration:  BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    'assets/iron_man.jpg',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Tony Stark',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'tony_stark@gmail.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_rounded),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.music_note_rounded),
            title: const Text('Music'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MusicScreen(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('User'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserScreen(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded),
            title: const Text('Setting'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingScreen(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
