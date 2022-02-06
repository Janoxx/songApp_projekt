// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// --- Init Widget ---
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // --- Zeitraum Anzeige ganz oben im Dashboard, bleibt angepinnt ---
  Widget dashboardDateBox(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.calendar_today, color: Colors.black),
            Text("Deine Releases vom: ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
                    ),
            Text("01.11.2021 - 07.11.2021",
                style: TextStyle(fontSize: 14, color: Colors.black)),
          ],
        ),
      ),
    );
  }

  // --- Main Widget ---
  @override
  Widget build(BuildContext context) {

    const String url = "https://open.spotify.com/track/6Sy9BUbgFse0n0LPA5lwy5?si=9ef71ba726a74aea";

    // --- URL Launcher ---
    void launchURL() async {
  if (!await launch(url)) throw 'Konnte $url nicht öffnen!';
}

    // --- OnRefresh Funktion ---
    Future<void> test() async {
      await Future.delayed(Duration(seconds: 3));
    }

    return Scaffold(
      body: Column(
      children: [
        dashboardDateBox(context),
        Expanded(
          child: RefreshIndicator(
            onRefresh: test,
            child: ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(
                      radius: 20,
                      foregroundImage: NetworkImage("https://i1.sndcdn.com/avatars-000731587054-tor78i-t500x500.jpg")
                      ),
                  title: Text("Darude"),
                  subtitle: Text("Sandstorm"),
                  trailing: Text("05.11.2021"),
                  onTap: () {
                    launchURL();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Divider(thickness: 1.5),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}