// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:songapp_projekt/home.dart';

class SplashscreenFunctions {
  // --- Simuliere Laden der App und lade Homescreen  --> Dauer: 2 Sekunden ---
  initLoading(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // --- InitState---
  @override
  void initState() {
    super.initState();
    SplashscreenFunctions().initLoading(context);
  }

  // --- Logo-Layout mit Ladesymbol im Splashscreen ---
  Widget startLogo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Image(
            image: AssetImage('assets/songApp-Logo_rounded.png'),
            width: 250,
            height: 250,
          ),
        ),
        Text("ReleaseRadar",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 36)),
        Text("Version 0.0.5",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
        SizedBox(height: 30),
        CircularProgressIndicator(
          backgroundColor: Colors.white,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFFC90000),
                Color(0xFFD40000),
                Color(0xFFE80000),
                Color(0xFFFF0000)
              ],
            ),
          ),
          child: Center(child: startLogo(context))),
    );
  }
}
