// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:songapp_projekt/utils/globals.dart' as globals;

class Artistinfo extends StatefulWidget {
  const Artistinfo({Key? key}) : super(key: key);

  @override
  _ArtistinfoState createState() => _ArtistinfoState();
}

class _ArtistinfoState extends State<Artistinfo> {
// --- Test Artist URL ---
  static const String url =
      "https://open.spotify.com/artist/0LhHRmSd1EYM5QdNeNnCoQ?si=dS9gcXlGTEmRhUliYZYSeg";

  // --- URL Launcher ---
  void launchURL() async {
    if (!await launch(url)) throw 'Konnte $url nicht öffnen!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Künstler*innenprofil"),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 35, 12),
                child: CircleAvatar(
                    radius: 70,
                    foregroundImage: NetworkImage(globals.profileImage)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    globals.profileName,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    globals.profileStyle,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Divider(
              thickness: 1.5,
            ),
          ),
          ListTile(
              leading: Icon(Icons.note_alt_rounded),
              title: Text(
                "Biographie: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(globals.profileBio)),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(globals.profileOrigin),
            trailing: Text("Herkunft"),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(globals.profileBirthday),
            trailing: Text("Geburtsjahr"),
          ),
          // ElevatedButton(
          // child: Text("Künstler*in Bei Spotify Anzeigen"),
          // onPressed: () {launchURL();},),
          ListTile(
            leading: Icon(Icons.note_alt),
            title: TextField(
              maxLines: null,
              maxLength: 200,
            ),
          ),
        ],
      ),
    );
  }
}
