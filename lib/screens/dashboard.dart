// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:songapp_projekt/providers/base_provider.dart';
import 'package:songapp_projekt/screens/albuminfo.dart';
import 'package:songapp_projekt/utils/globals.dart' as globals;

// --- Init Widget ---
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  // --- Init ---
  DBProvider dbProvider = DBProvider();

  Future<List> loadAlbumInfo() async {
    final db = await dbProvider.database;
    final res = await db.rawQuery('SELECT * FROM albums ORDER BY intYearReleased ASC');
    return res;
  }

  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      Dashboard();
    });
  }

  // --- Zeitraum Anzeige ganz oben im Dashboard, bleibt angepinnt ---
  Widget dashboardDateBox(BuildContext context) {

    // --- Init ---
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('dd.MM.yyyy').format(currentDate);
    Size size = MediaQuery.of(context).size;

    // --- Container Design ---
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Colors.grey.shade400, Colors.grey.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 2,
                color: Colors.black.withOpacity(0.5)),
          ],
        ),

        /// --- Container Inhalt ---
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.calendar_today, color: Colors.black),
            Text(
              "Aktuellste Alben: ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
            Text(formattedDate,
                style: TextStyle(fontSize: 14, color: Colors.black)),
          ],
        ),
      ),
    );
  }

  // --- Main Widget ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.blue,
        onRefresh: (){return onRefresh();},
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  dashboardDateBox(context),
                  Expanded(
                    child: FutureBuilder<List>(
                      future: loadAlbumInfo(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if(!snapshot.hasData){
                          return Text("");
                        } else {
                          return ListView.separated(
                            separatorBuilder: (context, index) => Divider(thickness: 1.5),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int i) {
                              return ListTile(
                                onTap: (){
                                  // --- Insert in Globals ---
                                  globals.idAlbum = snapshot.data[i]["idAlbum"].toString();
                                  globals.idArtistAlbum = snapshot.data[i]["idArtist"].toString();
                                  globals.strAlbum = snapshot.data[i]["strAlbum"];
                                  globals.strArtistAlbum = snapshot.data[i]["strArtist"];
                                  globals.intYearReleasedAlbum = snapshot.data[i]["intYearReleased"].toString();
                                  globals.strAlbumThumb = snapshot.data[i]["strAlbumThumb"];

                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumInfo()));
                                },
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image(
                                    width: 68, 
                                    height: 68, 
                                    image: NetworkImage(snapshot.data[i]["strAlbumThumb"] ?? "https://cdn.icon-icons.com/icons2/1674/PNG/512/questionmarkcircle_110957.png"),
                                    ),
                                ),
                                title: Text(snapshot.data[i]["strAlbum"]),
                                subtitle: Text(snapshot.data[i]["strArtist"]),
                                trailing: Icon(Icons.arrow_right_outlined),
                              );
                            }
                          );
                        }
                      }
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


// ClipRRect(
//   borderRadius: BorderRadius.circular(20.0),//or 15.0
//   child: Container(
//     height: 70.0,
//     width: 70.0,
//     color: Color(0xffFF0E58),
//     child: NetworkImage(snapshot.data[i]["strAlbumThumb"] ?? "https://cdn.icon-icons.com/icons2/1674/PNG/512/questionmarkcircle_110957.png")
//   ),
// ),

// CircleAvatar(radius: 30, foregroundImage: NetworkImage(snapshot.data[i]["strAlbumThumb"] ?? "https://cdn.icon-icons.com/icons2/1674/PNG/512/questionmarkcircle_110957.png")),
