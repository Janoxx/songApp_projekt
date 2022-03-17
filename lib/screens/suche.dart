// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unrelated_type_equality_checks, unnecessary_this
import 'package:flutter/material.dart';
import 'package:songapp_projekt/screens/artistinfo.dart';
import 'package:songapp_projekt/utils/globals.dart' as globals;
import 'package:songapp_projekt/providers/api_provider.dart';
import 'package:songapp_projekt/providers/base_provider.dart';

class SucheFunctions {
  // --- init DB Provider ---
  DBProvider dbProvider = DBProvider();

  /// --- Suche GET-Request ---
  Future<List> searchArtist() async {
    return APIProvider().getRequestArtist();
  }

  // --- Wenn keine Suche aktiv ---
  Future<List> noSearch() async {
    return [];
  }

  // --- Artist aus DB löschen ---
  clearArtists() async {
    final db = await dbProvider.database;
    final res = db.rawDelete('DELETE FROM artists');
    return res;
  }

//   // --- artist insert in db ---
//   createArtist(ArtistModel newArtist) async {
//     final db = await dbProvider.database;
//     final res = db.insert("artists", newArtist.toMap());
//     return res;
//   }
}

// --- Init Main Widget ---
class Suche extends StatefulWidget {
  const Suche({Key? key}) : super(key: key);

  @override
  _SucheState createState() => _SucheState();
}

class _SucheState extends State<Suche> {
  // --- Inits ---
  TextEditingController searchController = TextEditingController();
  Icon searchIcon = Icon(Icons.search, color: Colors.white);
  Icon followIcon = Icon(Icons.check_box_outline_blank, size: 35);
  DBProvider dbProvider = DBProvider();

  // --- Widget Suchleiste ---
  Widget searchBar(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
          autocorrect: false,
          controller: searchController,
          obscureText: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: searchIcon,
            hintText: 'Suche Artist...',
            hintStyle: TextStyle(color: Colors.white),
          ),
          onSubmitted: (filter) {
            globals.search = searchController.text.replaceAll(" ", "_");
            globals.isSearchTrue = true;
            setState(() {
              Suche();
            });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchBar(context),
                SizedBox(height: 10),
                Divider(thickness: 1.5),
                Expanded(
                    child: FutureBuilder<List>(
                        future: globals.isSearchTrue == false ? SucheFunctions().noSearch(): SucheFunctions().searchArtist(),
                        builder:(BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: Text(""));
                          } else {
                            return ListView.separated(
                              separatorBuilder: (context, index) => Divider(thickness: 1.5),
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int i) {
                                return Column(
                                  children: [
                                    Text("Gefundene Künstler:"),
                                    ListTile(
                                      onTap: (){
                                        globals.idArtist = snapshot.data[i]["idArtist"];
                                        globals.strArtist = snapshot.data[i]["strArtist"] ?? "Kein Name gefunden!";
                                        globals.strArtistThumb = snapshot.data[i]["strArtistThumb"] ?? "https://cdn.icon-icons.com/icons2/1674/PNG/512/questionmarkcircle_110957.png";
                                        globals.strBiography = snapshot.data[i]["strBiographyDE"] ?? snapshot.data[i]["strBiographyEN"] ?? "Keine Biographie gefunden!";
                                        globals.intBornYear = snapshot.data[i]["intBornYear"] ?? "Kein Geburtsjahr gefunden!";
                                        globals.strCountryCode = snapshot.data[i]["strCountryCode"] ?? "Kein Herkunftsland gefunden!";
                                        globals.strStyle = snapshot.data[i]["strStyle"] ?? snapshot.data[i]["strGenre"] ?? "Kein Genre gefunden!";
                                        globals.strWebsite = snapshot.data[i]["strWebsite"] ?? "Keine Website gefunden!";

                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Artistinfo()));
                                      },
                                      leading: CircleAvatar(radius: 30, foregroundImage: NetworkImage(snapshot.data[i]["strArtistThumb"] ?? "https://cdn.icon-icons.com/icons2/1674/PNG/512/questionmarkcircle_110957.png")),
                                      title:Text(snapshot.data[i]["strArtist"]),
                                      trailing: Icon(Icons.arrow_right_outlined)
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        }
                      )
                    )
              ],
            ),
          ),
        ],
      ),
    );
  }
}