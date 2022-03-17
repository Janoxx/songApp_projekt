// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:songapp_projekt/providers/api_provider.dart';
import 'package:songapp_projekt/providers/base_provider.dart';
import 'package:songapp_projekt/utils/globals.dart' as globals;

class Artistinfo extends StatefulWidget {
  const Artistinfo({Key? key}) : super(key: key);

  @override
  _ArtistinfoState createState() => _ArtistinfoState();
}

class _ArtistinfoState extends State<Artistinfo> {

  // --- Führe Funktion beim öffnen der Seite aus ---
  @override
    void initState() {
      super.initState();
      checkFollow();
    }

  // --- Init ---
  String followText = "Folgen";
  DBProvider dbProvider = DBProvider();
  TextEditingController noteController = TextEditingController();

  // --- Lösche Artist aus DB ---
  Future deleteArtist() async {
    final db = await dbProvider.database;
    final res = await db.rawQuery('DELETE FROM artists WHERE idArtist = ' + globals.idArtist);
    return res;
  }

  Future deleteAlbum() async {
    final db = await dbProvider.database;
    final res = await db.rawQuery('DELETE FROM albums WHERE idArtist = ' + globals.idArtist);
    return res;
  }

  Future deleteTracks() async {
    final db = await dbProvider.database;
    final res = await db.rawQuery('DELETE FROM tracks WHERE idAlbum = ' + globals.idAlbum);
    return res;
  }

  // --- Warnung, ob man dem Artist wirklich entfolgen möchte ---
  Future<void> unfollowAlert(BuildContext context) async {
    // --- Accept Button ---
    Widget acceptButton = TextButton(
     child: Text("Ja"),
      onPressed: (){

        // --- Reset Variable und lösche Inhalte ---
        globals.isFollowed = "0";
        deleteArtist();
        deleteAlbum();
        deleteTracks();

        setState(() {
          followText = "Folgen";
        });
        Navigator.pop(context);
      },
    );

    // --- Deny Button ---
    Widget denyButton = TextButton(
     child: Text("Nein", style: TextStyle(color: Colors.white)),
      onPressed: (){
        Navigator.pop(context);
      },
    );

    // --- Alert Popup ---
    AlertDialog alertFollow = AlertDialog(
      title: Text("Entfolgen?"),
      content: Text("Möchtest du dem Künstler wirklich entfolgen?"),
      actions: [acceptButton, denyButton],
    );

    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return alertFollow;
      }
    );
  }

  // --- Prüfe, ob dem Artist bereits gefolgt wird ---
  Future checkFollow() async {
    // --- Hole isFollowed Wert aus DB ---
    final db = await dbProvider.database;
    final res = await db.rawQuery("SELECT isFollowed FROM artists WHERE idArtist = " + globals.idArtist);

    // --- Ändere Text entsprechend ---
    if(res.toString() == "[{isFollowed: 1}]") {
      setState(() {
        followText = "Entfolgen";
      });
    } else if(res.toString() == "[{isFollowed: 0}]"){
      setState(() {
        followText = "Folgen";
      });
    } else {
      setState(() {
        followText = "Folgen"; //Default
      });
    }
    return true;
  }

  // --- Speicher Artist in die DB ---
  Future insertArtist() async {
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('dd.MM.yyyy').format(currentDate);

    final db = await dbProvider.database;
    final res =  await db.transaction((txn) async {
      int query = await txn.rawInsert(
        'INSERT INTO artists(idArtist, strArtist, intBornYear, strStyle, strWebsite, strArtistThumb, strBiography, strCountryCode, isFollowed, followDate, notiz) VALUES ('
        +       globals.idArtist + ','
        + '"' + globals.strArtist + '",'
        + '"' + globals.intBornYear + '",'
        + '"' + globals.strStyle + '",'
        + '"' + globals.strWebsite + '",'
        + '"' + globals.strArtistThumb + '",'
        + '"' + globals.strBiography.replaceAll("\"", "") + '",'
        + '"' + globals.strCountryCode + '",'
        + '"' + globals.isFollowed + '",'
        + '"' + formattedDate + '",'
        + '"' + noteController.text + '")'
      );
    });
    return res;
  }

  // // --- Speicher Notiz in die DB ---
  // Future insertNote() async {
  //   final db = await dbProvider.database;
  //  final res = await db.rawQuery("UPDATE artists SET notiz = " + noteController.text + " WHERE idArtist = " + globals.idArtist);
  //   return res;
  // }

  //  // --- Wähle Notiz ---
  // Future selectNote() async {
  //   final db = await dbProvider.database;
  //   final res = await db.rawQuery("SELECT notiz FROM artists WHERE idArtist = " + globals.idArtist);
  //   return res;
  // }

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
                    foregroundImage: NetworkImage(globals.strArtistThumb)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    globals.strArtist,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    globals.strStyle,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: (){
                      if(followText == "Folgen") {
                        
                        // --- Ändere Variable und speicher Artist in DB ---
                        globals.isFollowed = "1";
                        globals.currentArtist = globals.strArtist;
                        insertArtist();

                        // --- Hole & speichere Album + Track Details ---
                        APIProvider().getAlbumInfo();

                        setState(() {
                          followText = "Entfolgen";
                        });
                      } else {
                        unfollowAlert(context);
                      }
                    }, 
                    child: Text(followText, style: TextStyle(color: Colors.red))
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
              subtitle: Text(globals.strBiography)
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8,8,8,0),
            child: Divider(thickness: 1.5),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(globals.strCountryCode),
            trailing: Text("Herkunft"),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(globals.intBornYear),
            trailing: Text("Geburtsjahr"),
          ),
          ListTile(
            leading: Icon(Icons.note_alt),
            title: TextField(
              controller: noteController,
              maxLength: 200,
              onSubmitted: (value){
                //insertNote();
              }
            ),
          ),
        ],
      ),
    );
  }
}
