// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:songapp_projekt/screens/appinfo.dart';
import 'package:songapp_projekt/screens/changelog.dart';
import 'package:songapp_projekt/screens/settings.dart';
import 'package:songapp_projekt/screens/testPage.dart';

// --- Init Main Widget ---
class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
// --- Custom Drawer Header für die Sidebar ---
  Widget drawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.4, 0.7, 0.9],
          colors: [
            Color(0xFFC90000),
            Color(0xFFD40000),
            Color(0xFFE80000),
            Color(0xFFFF0000)
          ],
        ),
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/songApp-Logo_rounded.png'),
            width: 100,
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              "ReleaseRadar",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }

  // --- Main Sidebar Widget ---
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          drawerHeader(context),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text("Einstellungen"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              }),
          const Divider(
            thickness: 1.5,
          ),
          ListTile(
              leading: Icon(Icons.timer),
              title: Text("Changelog"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Changelog()));
              }),
          const Divider(
            thickness: 1.5,
          ),
          ListTile(
              leading: Icon(Icons.info),
              title: Text("App Info"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AppInfo()));
              }),
          const Divider(
            thickness: 1.5,
          ),
          ListTile(
              leading: Icon(Icons.developer_mode),
              title: Text("Developer Test-Seite"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestPage()));
              }),
          const Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
