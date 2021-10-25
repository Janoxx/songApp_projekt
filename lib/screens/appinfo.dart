import 'package:flutter/material.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({ Key? key }) : super(key: key);

  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('App Info'),
        ),
    );
  }
}