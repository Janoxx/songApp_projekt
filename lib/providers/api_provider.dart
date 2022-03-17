// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:songapp_projekt/providers/base_provider.dart';
import 'dart:convert';
import 'package:songapp_projekt/utils/globals.dart' as globals;

// --- Test Request mit Spotify API ---
class APIProvider {

  // --- Init ---
  String currentAlbum = "";
  int currentAlbumID = 0;
  DBProvider dbProvider = DBProvider();

  Future<List> getMarioRequest() async {
    // --- GET Request an API ---

    String marioTest = "https://mario-kart-tour-api.herokuapp.com/api/v1/" + globals.arg1 + "/" + globals.arg2;

    // --- Sende Request ---
    debugPrint("Sende getRequest an " + marioTest);
    var getRequest = await http.get(Uri.parse(marioTest), headers: {"Content-Type":"application/json"});

    // --- Dekodiere Request (JSON) ---
    var jsonData = json.decode(getRequest.body);

    // -- Gebe Request Inhalt zurück ---
    return jsonData;
  }

  Future<List> getRequestArtist() async {
    String url =  "https://www.theaudiodb.com/api/v1/json/" + globals.apiToken + "/search.php?s=" + globals.search;
    var getRequest = await http.get(Uri.parse(url), headers: {"Content-Type":"application/json"}); 
    var jsonData = json.decode(getRequest.body);
    return jsonData["artists"] ?? List<int>.filled(0,0);
  }

  Future<List> getAlbumInfo() async {
    // --- Hole Teilinfo vom aktuellsten Album ---
    String urlCurrentAlbum =  "https://www.theaudiodb.com/api/v1/json/" + globals.apiToken + "/discography.php?s=" + globals.currentArtist;
    var currentGetRequest = await http.get(Uri.parse(urlCurrentAlbum), headers: {"Content-Type":"application/json"});
    var currentJsonData = json.decode(currentGetRequest.body);
    currentAlbum = currentJsonData["album"][0]["strAlbum"] ?? "Keine Alben vorhanden!";

    // --- Hole volle Infos zum aktuellsten Album ---
    String urlFullAlbum =  "https://www.theaudiodb.com/api/v1/json/" + globals.apiToken + "/searchalbum.php?s=" + globals.currentArtist + "&a=" + currentAlbum;
    var fullGetRequest = await http.get(Uri.parse(urlFullAlbum), headers: {"Content-Type":"application/json"}); 
    var fullJsonData = json.decode(fullGetRequest.body);
    currentAlbum = fullJsonData["album"][0]["idAlbum"];

    // --- Hole Infos zu den Tracks der Alben ---
    String urlTracks =  "https://www.theaudiodb.com/api/v1/json/" + globals.apiToken + "/track.php?m=" + currentAlbum;
    var trackGetRequest = await http.get(Uri.parse(urlTracks), headers: {"Content-Type":"application/json"}); 
    var trackJsonData = json.decode(trackGetRequest.body);
    debugPrint(trackJsonData["track"].length.toString());

    // --- Insert Album in DB ---
    Future insertAlbum() async {
    final db = await dbProvider.database;
    final res = await db.transaction((txn) async {
      int query = await txn.rawInsert(
        'INSERT INTO albums(idAlbum, idArtist, strAlbum, strArtist, intYearReleased, strAlbumThumb) VALUES ('
        +       fullJsonData["album"][0]["idAlbum"] + ','
        +       fullJsonData["album"][0]["idArtist"] + ','
        + '"' + fullJsonData["album"][0]["strAlbum"] + '",'
        + '"' + fullJsonData["album"][0]["strArtist"] + '",'
        + '"' + fullJsonData["album"][0]["intYearReleased"] + '",'
        + '"' + fullJsonData["album"][0]["strAlbumThumb"] + '")'
      );
    });
    return res;
  }

  // --- Insert Tracks in DB ---
    Future insertTrack() async {
      final db = await dbProvider.database;
      final res = await db.transaction((txn) async {
        // --- For-Schleife zum Abspeichern aller Tracks auf dem Album ---
        for(int i = 0; i < trackJsonData["track"].length; i++){
          await txn.rawInsert(
          'INSERT INTO tracks(idTrack, idAlbum, idArtist, strTrack, strAlbum, strArtist, intDuration) VALUES ('
          +       trackJsonData["track"][i]["idTrack"] + ','
          +       trackJsonData["track"][i]["idAlbum"] + ','
          +       trackJsonData["track"][i]["idArtist"] + ','
          + '"' + trackJsonData["track"][i]["strTrack"] + '",'
          + '"' + trackJsonData["track"][i]["strAlbum"] + '",'
          + '"' + trackJsonData["track"][i]["strArtist"] + '",'
          + '"' + trackJsonData["track"][i]["intDuration"] + '")'
        );
      }
    });
    return res;
    }

    insertAlbum();
    insertTrack();

    return fullJsonData["album"];
  }
}