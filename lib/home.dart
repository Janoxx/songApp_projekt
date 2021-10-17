import 'package:flutter/material.dart';
import 'package:songapp_projekt/screens/sidebar.dart';
import 'package:songapp_projekt/utils/globals.dart' as globals;
import 'package:songapp_projekt/screens/dashboard.dart';
import 'package:songapp_projekt/screens/follows.dart';
import 'package:songapp_projekt/screens/suche.dart';

// --- Init Widget ---
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // --- Main Widgets ---
  final widgets = [
    const Center(child: Dashboard()),
    const Center(child: Suche()),
    const Center(child: Follows())
  ];


  // --- App "Grundgerüst" ---
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: mainAppBar(),
        body: widgets[globals.currentIndex],
        drawer: const Sidebar(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: globals.currentIndex,
          selectedItemColor: Colors.red,
          elevation: 0,
          onTap: (index){
            setState(() {
              globals.currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              label: 'Dashboard'
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Suche'
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'Folge ich'
              ),
          ],
        ),
      );
  }

  // --- Grundlegendes AppBar Design ---
  PreferredSizeWidget mainAppBar(){
  String appBarName = "";

    // --- Ändere AppBar Title ---
    switch(globals.currentIndex){
      case 0: appBarName = "Dashboard";
      break;
      case 1: appBarName = "Suche";
      break;
      case 2: appBarName = "Folge ich";
      break;
      default: appBarName = "Dashboard";
    }

    // --- AppBar Design ---
    return PreferredSize(
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(appBarName),
        ),
      preferredSize: const Size.fromHeight(50),
      );
  }
}