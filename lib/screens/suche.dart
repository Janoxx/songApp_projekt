import 'package:flutter/material.dart';

// --- Init Main Widget ---
class Suche extends StatefulWidget {
  const Suche({ Key? key }) : super(key: key);

  @override
  _SucheState createState() => _SucheState();
}

class _SucheState extends State<Suche> {

  @override
  Widget build(BuildContext context) {    
    return const Scaffold(
      body: Center(child: Text("bla 2"),),
    );
  }
}