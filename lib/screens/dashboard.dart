// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:flutter/material.dart';
import 'package:songapp_projekt/screens/changelog.dart';

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

    // --- OnRefresh Funktion ---
    Future<void> test() async {
      await Future.delayed(Duration(seconds: 3));
      print("test");
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
                      foregroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/LGBTQ%2B_rainbow_flag_Quasar_%22Progress%22_variant.svg/2560px-LGBTQ%2B_rainbow_flag_Quasar_%22Progress%22_variant.svg.png")
                      ),
                  title: Text("Drachenlord"),
                  subtitle: Text("Skrr Skrr in meinem Audi"),
                  trailing: Text("05.11.2021"),
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Changelog()));
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