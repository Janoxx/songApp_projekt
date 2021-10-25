import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:songapp_projekt/home.dart';

void main() {
  runApp(const SongApp());
}

class SongApp extends StatelessWidget {
  const SongApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Song App Schulprojekt',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
} 