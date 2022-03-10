// ignore_for_file: file_names, unnecessary_this, prefer_collection_literals
class TrackModel {

  int idTrack = 0;
  int idAlbum = 0;
  int idArtist = 0;
  String strTrack = "";
  String strAlbum = "";
  String strArtist = "";
  int intDuration = 0;
  String strGenre = "";
  String strStyle = "";
  String strTrackThumb = "";
  int intTotalPlays = 0;

  TrackModel(this.idTrack, this.idAlbum, this.idArtist, this.strTrack, this.strAlbum, this.strArtist, this.intDuration, this.strGenre, this.strStyle, this.strTrackThumb, this.intTotalPlays);

  TrackModel.fromMap(dynamic json) {
    this.idTrack = json["idTrack"];
    this.idAlbum = json["idAlbum"];
    this.idArtist = json["idArtist"];
    this.strTrack = json["strTrack"];
    this.strAlbum = json["strAlbum"];
    this.strArtist = json["strArtist"];
    this.intDuration = json["intDuration"];
    this.strGenre = json["strGenre"];
    this.strStyle = json["strStyle"];
    this.strTrackThumb = json["strTrackThumb"];
    this.intTotalPlays = json["intTotalPlays"];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["idTrack"] = idTrack;
    map["idAlbum"] = idAlbum;
    map["idArtist"] = idArtist;
    map["strTrack"] = strTrack;
    map["strAlbum"] = strAlbum;
    map["strArtist"] = strArtist;
    map["intDuration"] = intDuration;
    map["strGenre"] = strGenre;
    map["strStyle"] = strStyle;
    map["strTrackThumg"] = strTrackThumb;
    map["intTotalPlays"] = intTotalPlays;
    return map;
  }
  
}