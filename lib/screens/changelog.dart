import 'package:flutter/material.dart';

class Changelog extends StatefulWidget {
  const Changelog({ Key? key }) : super(key: key);

  @override
  _ChangelogState createState() => _ChangelogState();
}

class _ChangelogState extends State<Changelog> {

Widget ChangelogBody(BuildContext context){
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Version 1.0.0", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("- Erstellung des 'Grundgerüsts' mit Default AppBar und BottomNavigationBar --> home.dart \n" +
              " - Anlegen grundlegender Seiten (Dashboard, Suche, Folge-Ich, Einstellungen, App Info und Changelog) \n" + 
              "- Erstellung erste Sidebar"
          ),
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
        title: Text('Change-Log'),
        ),
        body: ChangelogBody(context)
    );
  }
}