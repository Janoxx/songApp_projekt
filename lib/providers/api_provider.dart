// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:songapp_projekt/utils/globals.dart' as globals;

// --- Test Request mit Spotify API ---
class APIProvider {

  // -- Test URL ---
  // static String testArtist = "http://api.spotify.com/v1/artists/14dmbYen0AciYxu5n4Fkpd";
  // static String albumTest = "https://api.spotify.com/v1/artists/{" + globals.artistID + "}/albums";

  // static String postTest = "https://api.spotify.com/v1/artists/{id}/albums";
  // static String accessToken = "BQAMuez4xvUIdtmDlqsmtwAmatQe7DpbvqOyOLNt2yCpPkrUgYh4DYcpLKnKRLXRinVAK2jgpJRTBIEUbuyTgjySXPjY2Mw6ZivCyBvhSFYfDEKb41AkHJspoB5pWCyTqh80WaluBEV6WOQ";

  // Future authRequest() async {
  //   var postRequest = await http.post(Uri.parse(postTest), headers: {"Authorization":accessToken});
  //   return postRequest;
  // }

  // --- GET Request an Spotify API ---
  Future<List> getRequest() async {

    String marioTest = "https://mario-kart-tour-api.herokuapp.com/api/v1/" + globals.arg1 + "/" + globals.arg2;

    // debugPrint("Sende Auth...");
    // authRequest();

    // --- Sende Request ---
    debugPrint("Sende getRequest an " + marioTest);
    var getRequest = await http.get(Uri.parse(marioTest), headers: {"Content-Type":"application/json"});

    // --- Dekodiere Request (JSON) ---
    var jsonData = json.decode(getRequest.body);
    debugPrint(jsonData.toString());

    // -- Gebe Request Inhalt zurück ---
    return jsonData;
  }
}