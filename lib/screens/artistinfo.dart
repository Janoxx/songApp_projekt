// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Artistinfo extends StatefulWidget {
  const Artistinfo({ Key? key }) : super(key: key);

  @override
  _ArtistinfoState createState() => _ArtistinfoState();
}

class _ArtistinfoState extends State<Artistinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Künstler*innenprofil"),
        ),
    body: ListView(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 35, 12),
              child: CircleAvatar(radius: 70,foregroundImage: NetworkImage(
                          "https://i1.sndcdn.com/avatars-000731587054-tor78i-t500x500.jpg")),
            ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Darude", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text("EDM", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
        ],)
          ],
        ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Divider(thickness: 1.5,),
      ),
      ListTile(leading: Icon(Icons.group), title: Text("2,527,560"), trailing: Text("Follower"),),
      ListTile(leading: Icon(Icons.show_chart), title: Text("90"), trailing: Text("Popularity Indicator"),),
      ElevatedButton(child: Text("Künstler*in Bei Spotify Anzeigen"),onPressed: () {
        
      },),
      ListTile(leading: Icon(Icons.note_alt), title: TextField(maxLines: null, maxLength: 200,),),
      ],
    ),
    );
  }
}