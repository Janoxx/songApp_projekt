// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('App Info'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("So funktioniert es:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "Die App erleichtert die Übersicht bei Song Releases deiner Lieblingskünstler und Lieblingskünstlerinnen. Indem du Künstlern und Künstlerinnen folgen kannst, werden dir aktuelle Releases auf der Startseite übersichtlich angezeigt."),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Startseite:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Text(
                "Hier siehst du in einer Übsersicht, sortiert nach Tag, Woche oder Monat, die aktuellen Realeases der Künstler und Künstlerinnen denen du folgst."),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Suche:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Text(
                "Hier kannst du nach deinen Lieblingskünstler und Lieblingskünstlerinnen suchen, ihenen folgen und ihre Profile aufrufen."),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Folge ich:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Text(
                "Hier siehst du eine Übersicht deiner gefolgten Künstler und Künstlerinnen. Du kannst gefolgten Künstlern und Künstlerinnen hier wieder entfolgen und auf ihr Profil zugreifen. "),
          ),
        ],
      ),
    );
  }
}
