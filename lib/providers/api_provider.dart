// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// --- Test Request mit Spotify API ---
class APIProvider {

  // -- Test URL ---
  static String testArtist = "http://api.spotify.com/v1/artists/14dmbYen0AciYxu5n4Fkpd";

  static String testValario = "https://mario-kart-tour-api.herokuapp.com/api/v1/drivers/babies";

  // --- GET Request an Spotify API ---
  Future<List> getRequest() async {

    debugPrint("Sende Request...");

    // --- Sende Request ---
    var getRequest = await http.get(Uri.parse(testValario), headers: {"Content-Type":"application/json"});

    // --- Dekodiere Request (JSON) ---
    var jsonData = json.decode(getRequest.body);

    // -- Gebe Request Inhalt zurück ---
    return jsonData;
  }
}