// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:songapp_projekt/providers/base_provider.dart';
import 'package:songapp_projekt/utils/globals.dart' as globals;

class AlbumInfo extends StatefulWidget {
  const AlbumInfo({ Key? key }) : super(key: key);

  @override
  State<AlbumInfo> createState() => _AlbumInfoState();
}

class _AlbumInfoState extends State<AlbumInfo> {

  // --- Init ---
  DBProvider dbProvider = DBProvider();

  // --- Hole alle Tracks vom Album ---
  Future<List> getTracks() async {
    final db = await dbProvider.database;
    final res = await db.rawQuery('SELECT * FROM tracks WHERE idAlbum = ' + globals.idAlbum);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Album-Informationen"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 32, 8, 8),
            child: Column(
              children: [
                Image(width: 250, height: 250, image: NetworkImage(globals.strAlbumThumb == "" ? "https://cdn.icon-icons.com/icons2/1674/PNG/512/questionmarkcircle_110957.png" : globals.strAlbumThumb)),
                SizedBox(height: 5),
                Text(globals.strAlbum, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(globals.strArtistAlbum, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                Divider(thickness: 1.5),
                Expanded(
                  child: FutureBuilder<List>(
                      future: getTracks(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if(!snapshot.hasData){
                          return Text("");
                        } else {
                          return ListView.separated(
                            separatorBuilder: (context, index) => Divider(thickness: 1.5),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int i) {
                              // --- Duration in Minuten umrechnen ---
                              Duration timeDuration = Duration(milliseconds: snapshot.data[i]["intDuration"]);
                              int timeSeconds = timeDuration.inSeconds;
                              return ListTile(
                                leading: Icon(Icons.music_note, color: Colors.red),
                                title: Text(snapshot.data[i]["strTrack"]),
                                trailing: Text(timeSeconds.toString() + " Sek."),
                              );
                            },
                          );
                        }
                      }
                    ),
                ),
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(thickness: 1.5),
          ),
        ],
      )
    );
  }
}