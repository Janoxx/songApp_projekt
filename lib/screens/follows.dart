// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'artistinfo.dart';

// --- Init Main Widgets ---
class Follows extends StatefulWidget {
  const Follows({Key? key}) : super(key: key);

  @override
  _FollowsState createState() => _FollowsState();
}

class _FollowsState extends State<Follows> {
  Icon followIcon = Icon(Icons.check_box,size: 35,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        ListTile( onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Artistinfo()));
        },
          leading: CircleAvatar(
              radius: 20,
              foregroundImage: NetworkImage(
                  "https://i1.sndcdn.com/avatars-000731587054-tor78i-t500x500.jpg")),
          title: Text("Darude"),
          subtitle: Text("Gefolgt seit: xx.xx.xxxx"),
          trailing: IconButton(icon: followIcon, onPressed: (){
            setState(() {
              if(followIcon.icon == Icons.check_box) {
               followIcon = Icon(Icons.check_box_outline_blank, size: 35,);
              }
              else {
                followIcon = Icon(Icons.check_box,size: 35,);
              }
            });
          },),
        ),
        Divider(thickness: 1.5),
      ]),
    );
  }
}
