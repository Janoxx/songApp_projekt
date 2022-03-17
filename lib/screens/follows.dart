// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:songapp_projekt/providers/base_provider.dart';
import 'package:songapp_projekt/utils/globals.dart' as globals;
import 'artistinfo.dart';

// --- Init Main Widgets ---
class Follows extends StatefulWidget {
  const Follows({Key? key}) : super(key: key);

  @override
  _FollowsState createState() => _FollowsState();
}

class _FollowsState extends State<Follows> {
  DBProvider dbProvider = DBProvider();
  bool follow = false;

  Future<List> showFollowedArtists() async {
    final db = await dbProvider.database;
    final res = await db.rawQuery('SELECT * FROM artists ORDER BY strArtist ASC');
    return res;
  }

  Future<List> noArtists() async {
    return [];
  }

  // --- Lösche Artist aus DB ---
  Future deleteArtist() async {
    final db = await dbProvider.database;
    final res = await db.rawQuery('DELETE FROM artists WHERE idArtist = ' + globals.idArtist);
    return res;
  }

  // --- Lade Seiteninhalt neu ---
  Future<void> onRefresh(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      Follows();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        
        color: Colors.blue,
        onRefresh: (){
          return onRefresh(context);
          },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Gefolgte Künstler:innen:"),
                  SizedBox(height: 10),
                  Expanded(
                    child: FutureBuilder<List>(
                      future: showFollowedArtists(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if(!snapshot.hasData) {
                          return Text("");
                        } else {
                          return ListView.separated(
                            separatorBuilder: (context, index) => Divider(thickness: 1.5),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int i) {
                              return ListTile(
                                onTap: (){
                                  globals.idArtist = snapshot.data[i]["idArtist"].toString();
                                  globals.strArtist = snapshot.data[i]["strArtist"] ?? "Kein Name gefunden!";
                                  globals.strArtistThumb = snapshot.data[i]["strArtistThumb"] ?? "https://cdn.icon-icons.com/icons2/1674/PNG/512/questionmarkcircle_110957.png";
                                  globals.strBiography = snapshot.data[i]["strBiography"] ?? "Keine Biographie gefunden!";
                                  globals.intBornYear = snapshot.data[i]["intBornYear"].toString() == "" ? "Kein Geburtsjahr gefunden!" : snapshot.data[i]["intBornYear"].toString();
                                  globals.strCountryCode = snapshot.data[i]["strCountryCode"] ?? "Kein Herkunftsland gefunden!";
                                  globals.strStyle = snapshot.data[i]["strStyle"] ?? snapshot.data[i]["strGenre"] ?? "Kein Genre gefunden!";
                                  globals.strWebsite = snapshot.data[i]["strWebsite"];
      
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Artistinfo()));
                                },
                                leading: CircleAvatar(radius: 30, foregroundImage: NetworkImage(snapshot.data[i]["strArtistThumb"] ?? "https://cdn.icon-icons.com/icons2/1674/PNG/512/questionmarkcircle_110957.png")),
                                title: Text(snapshot.data[i]["strArtist"], style: TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text("Gefolgt seit: " + snapshot.data[i]["followDate"]),
                                trailing: Icon(Icons.arrow_right_outlined)
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
