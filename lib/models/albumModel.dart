// ignore_for_file: file_names, unnecessary_this, prefer_collection_literals
class AlbumModel {

  int idAlbum = 0;
  int idArtist = 0;
  String strAlbum = "";
  String strArtist = "";
  int intYearReleased = 0;
  String strStyle = "";
  String strGenre = "";
  String strAlbumThumb = "";
  String strDescriptionEN = "";
  String strDescriptionDE = "";

  AlbumModel(this.idAlbum, this.idArtist, this.strAlbum, this.strArtist, this.intYearReleased, this.strStyle, this.strGenre, this.strAlbumThumb, this.strDescriptionEN, this.strDescriptionDE);

  AlbumModel.fromMap(dynamic json) {
    this.idAlbum = json["idAlbum"];
    this.idArtist = json["idArtist"];
    this.strAlbum = json["strAlbum"];
    this.strArtist = json["strArtist"];
    this.intYearReleased = json["intYearReleased"];
    this.strStyle = json["strStyle"];
    this.strGenre = json["strGenre"];
    this.strAlbumThumb = json["strAlbumThumb"];
    this.strDescriptionEN = json["strDescriptionEN"];
    this.strDescriptionDE = json["strDescriptionDE"];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["idAlbum"] = idAlbum;
    map["idArtist"] = idArtist;
    map["strAlbum"] = strAlbum;
    map["strArtist"] = strArtist;
    map["intYearReleased"] = intYearReleased;
    map["strStyle"] = strStyle;
    map["strGenre"] = strGenre;
    map["strAlbumThumb"] = strAlbumThumb;
    map["strDescriptionEN"] = strDescriptionEN;
    map["strDescriptionDE"] = strDescriptionDE;
    return map;
  }
}