// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

// --- Init Main Widgets ---
class Follows extends StatefulWidget {
  const Follows({ Key? key }) : super(key: key);

  @override
  _FollowsState createState() => _FollowsState();
}

class _FollowsState extends State<Follows> {
  @override
  Widget build(BuildContext context) {

    IconButton followIcon = IconButton(icon: Icon(Icons.check_box), onPressed: (){});

    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.calendar_view_day),
            title: Text("Fett"),
            subtitle: Text("Auch fett"),
            trailing: followIcon,
          ),
        ],
      )
    );
  }
}