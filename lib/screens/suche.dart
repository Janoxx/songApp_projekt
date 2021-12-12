// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unrelated_type_equality_checks, unnecessary_this
import 'package:flutter/material.dart';

class SucheFunctions {
  /// --- Suchfunktion ---
  doSearch() {
    // H A L O
  }
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
          hintText: 'Suche...',
          hintStyle: TextStyle(color: Colors.white),
        ),
        onSubmitted: SucheFunctions().doSearch(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchBar(context),
                // SizedBox(height: 10),
                // Text(
                //   "Deine Suchen: ",
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}