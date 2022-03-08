// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:songapp_projekt/utils/globals.dart' as globals;

// --- Test Request mit Spotify API ---
class APIProvider {

  Future<List> getMarioRequest() async {
    // --- GET Request an API ---

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

  Future<List> getRequest() async {

    String url =  "https://www.theaudiodb.com/api/v1/json/" + globals.apiToken + "/" + globals.functionToCall + globals.search;

    var getRequest = await http.get(Uri.parse(url), headers: {"Content-Type":"application/json"}); 
    debugPrint("URL: " + url);

    var jsonData = json.decode(getRequest.body);
    debugPrint(jsonData.toString());

    return jsonData["artists"] ?? List<int>.filled(0,0);
  }
}