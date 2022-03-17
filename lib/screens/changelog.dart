// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Changelog extends StatefulWidget {
  const Changelog({Key? key}) : super(key: key);

  @override
  _ChangelogState createState() => _ChangelogState();
}

class _ChangelogState extends State<Changelog> {
  Widget changelogBody(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Version BETA 1.0",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "- Vervollständigung der Such-Funktion via REST-API\n\n"
            "- Anlegen der Datenbankstruktur\n\n"
            "- Speichern der 'gefolgten Artists' + Alben/Tracks in die Datenbank\n\n"
            "- Abrufen via SQL und Darstellung aller Daten\n\n"
            "- Ausbau der GET-Requests an die API\n\n"
            "- Anlegen und Gestaltung der Album-Infoseite\n\n"
            "- Einige Bugfixes\n\n"
            "- Logout-Button in der Sidebar eingebaut"
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Version 0.0.7",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "- Erstellung einer API-Test Seite (Daten von Test-API benutzerdefiniert abrufen und in Liste anzeigen)"
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
         Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Version 0.0.6",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "- Erstelunng base_provider (Datenbank) + Test-Insert \n\n"
            "- Erstellung APIProvider (GET-Requests) --> Token fehlt noch\n\n"
            "- Erstellung Dev-Test-Seite --> API Output\n\n"
            "- Request 'Layout' erstellt --> FutureBuilder\n\n"
            "- Globale Versionierung"
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Version 0.0.5",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("- Erstellung Followliste \n \n"
                      "- Erstellung Künstler*innenprofil"
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Version 0.0.4",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("- Erstellung Splashscreen \n\n"
              "- Suchleiste hinzugefügt \n\n"
              "- URL's können geöffnet werden"),
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Version 0.0.3",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("- Erstellung Dashboard Design \n \n"
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
          child: Text("- Erstellung der AppInfo \n \n"
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
              "- Erstellung des 'Grundgerüsts' mit Default AppBar und BottomNavigationBar --> home.dart \n \n"
              "- Anlegen grundlegender Seiten (Dashboard, Suche, Folge-Ich, Einstellungen, App Info und Changelog) \n \n"
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
