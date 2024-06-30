import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'MH MORSEKURJATUL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('HOME'),
            onTap: () {
              // Navigate to home
            },
          ),
          ListTile(
            title: const Text('ABOUT'),
            onTap: () {
              // Navigate to about
            },
          ),
          ListTile(
            title: const Text('SKILLS'),
            onTap: () {
              // Navigate to skills
            },
          ),
          ListTile(
            title: const Text('WORKS'),
            onTap: () {
              // Navigate to works
            },
          ),
          ListTile(
            title: const Text('HIRE ME'),
            onTap: () {
              // Handle hire me action
            },
          ),
        ],
      ),
    );
  }
}
