// ignore_for_file: file_names, unnecessary_this, prefer_collection_literals
class ArtistModel {
  
  int idArtist = 0;
  String strArtist = "";
  int intBornYear = 0;
  String strStyle = "";
  String strGenre = "";
  String strWebsite = "";
  String strBiographyEN = "";
  String strBiographyDE = "";
  String strArtistThumb = "";
  String strCountryCode = "";
  String strArtistBanner = "";

  ArtistModel(this.idArtist, this.strArtist, this.intBornYear, this.strStyle, this.strGenre, this.strWebsite, this.strBiographyEN, this.strBiographyDE, this.strArtistThumb, this.strCountryCode, this.strArtistBanner);

  ArtistModel.fromMap(dynamic json) {
    this.idArtist = json["idArtist"];
    this.strArtist = json["strArtist"];
    this.intBornYear = json["intBornYear"] ?? "";
    this.strStyle = json["strStyle"] ?? "";
    this.strGenre = json["strGenre"] ?? "";
    this.strWebsite = json["strWebsite"] ?? "";
    this.strBiographyEN = json["strBiographyEN"] ?? "";
    this.strBiographyDE = json["strBiographyDE"] ?? "";
    this.strArtistThumb = json["strArtistThumb"] ?? "";
    this.strCountryCode = json["strCountryCode"] ?? "";
    this.strArtistBanner = json["strArtistBanner"] ?? "";
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["idArtist"] = idArtist;
    map["strArtist"] = strArtist;
    map["intBornYear"] = intBornYear;
    map["strStyle"] = strStyle;
    map["strGenre"] = strGenre;
    map["strWebsite"] = strWebsite;
    map["strBiographyEN"] = strBiographyEN;
    map["strBiographyDE"] = strBiographyDE;
    map["strArtistThumb"] = strArtistThumb;
    map["strCountryCode"] = strCountryCode;
    map["strArtistBanner"] = strArtistBanner;

    return map;
  }
}