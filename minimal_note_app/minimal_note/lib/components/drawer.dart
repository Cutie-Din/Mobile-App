// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minimal_note/components/drawer_tile.dart';
import 'package:minimal_note/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // Header
          const DrawerHeader(
            child: Icon(
              Icons.note,
              size: 120,
            ),
          ),
          // Note Tile
          DrawerTile(
            title: "Notes",
            leading: const Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          // Settings Tile
          DrawerTile(
            title: "Settings",
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
