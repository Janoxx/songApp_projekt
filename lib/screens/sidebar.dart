import 'package:flutter/material.dart';
import 'package:songapp_projekt/screens/appinfo.dart';
import 'package:songapp_projekt/screens/changelog.dart';
import 'package:songapp_projekt/screens/settings.dart';


class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  Widget materialIcon(BuildContext context) {
    return const Material(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.music_note_rounded,
          size: 60,
        ),
      ),
    );
  }

  Widget drawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.red,
            Colors.redAccent,
            Colors.redAccent,
          ],
              stops: [
            0.4,
            0.6,
            0.8
          ])),
      child: Column(
        children: [
          materialIcon(context),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              "Song App",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }

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
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
              }
          ),
          const Divider(
            thickness: 1.5,
          ),
           ListTile(
            leading: Icon(Icons.timer),
            title: Text("Changelog"),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Changelog()));
              }
          ),
          const Divider(
            thickness: 1.5,
          ),
           ListTile(
            leading: Icon(Icons.info),
            title: Text("App Info"),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AppInfo()));
              }
          ),
          const Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
