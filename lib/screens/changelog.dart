import 'package:flutter/material.dart';

class Changelog extends StatefulWidget {
  const Changelog({Key? key}) : super(key: key);

  @override
  _ChangelogState createState() => _ChangelogState();
}

class _ChangelogState extends State<Changelog> {
  Widget changelogBody(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Version 0.0.3",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("- Erstellung Dashboard Design \n \n" +
                      "- Einbindung Logo in Sidebar und App Info"),
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Version 0.0.2",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("- Erstellung der AppInfo \n \n" +
                      "- Beschreibung der App Funktionen"),
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Version 0.0.1",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
                  "- Erstellung des 'Grundgerüsts' mit Default AppBar und BottomNavigationBar --> home.dart \n \n" +
                  "- Anlegen grundlegender Seiten (Dashboard, Suche, Folge-Ich, Einstellungen, App Info und Changelog) \n \n" +
                  "- Erstellung der Sidebar"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text('Change-Log'),
        ),
        body: changelogBody(context));
  }
}