// ignore_for_file: unnecessary_null_comparison
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBProvider {

  static final DBProvider db = DBProvider();

  DBProvider();

  // --- Init ---
  Future<Database> get database async {
   Database _database = await initDB();
   
    if(_database != null) return _database;
    return _database;
  }

  // --- Erstelle oder Öffne Datenbank ---
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'releaseRadar.db');

    const initScript = [
      '''
        CREATE TABLE artists(artistID INTEGER PRIMARY KEY, artistName TEXT, artistFollowers INTEGER, artistGenre TEXT, artistImageURL TEXT, artistSpotifyURL TEXT)
      ''',

      '''
        CREATE TABLE tracks(trackID INTEGER PRIMARY KEY, trackName TEXT, trackURL TEXT, trackDuration INTEGER, trackRelease TEXT, artistID INTEGER, albumID INTEGER, test INTEGER)
      ''',

      '''
        CREATE TABLE albums(albumID INTEGER PRIMARY KEY, albumTotalTracks INTEGER, albumName TEXT, albumURL TEXT, albumImageURL TEXT, albumGenre TEXT, artistID INTEGER)
      ''',

      '''
        CREATE TABLE settings(settingID INTEGER PRIMARY KEY)
      '''
    ];

    const migrationScripts = [];

        // --- Öffne Datenbank ---
    return await openDatabase(path, version: migrationScripts.length + 1, 
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        for (var script in initScript) {
          await db.execute(script);
        }
      },
          // --- DB Versionierung ---
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        for(var i = oldVersion - 1; i <= newVersion -1; i++) {
          await db.execute(migrationScripts[i]);
        }
      }
    );
  }

  // --- Lösche Datenbank ---
  dropDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'releaseRadar.db');
    await deleteDatabase(path);
  }
}