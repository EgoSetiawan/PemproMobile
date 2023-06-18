class HomeResonponse {
  bool error;
  int code;
  String message;
  List<TouristSite> touristSites;

  HomeResonponse({
    required this.error,
    required this.code,
    required this.message,
    required this.touristSites,
  });

  factory HomeResonponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> touristSitesJson = json['touristSities'];
    List<TouristSite> touristSites = touristSitesJson
        .map((touristSiteJson) => TouristSite.fromJson(touristSiteJson))
        .toList();

    return HomeResonponse(
      error: json['error'] as bool,
      code: json['code'] as int,
      message: json['message'] as String,
      touristSites: touristSites,
    );
  }
}

class TouristSite {
  int touristSitesId;
  String touristSitesName;
  String touristSitesDescription;
  String photoUrl;
  String category;
  double lan;
  double lon;

  TouristSite({
    required this.touristSitesId,
    required this.touristSitesName,
    required this.touristSitesDescription,
    required this.photoUrl,
    required this.category,
    required this.lan,
    required this.lon,
  });

  factory TouristSite.fromJson(Map<String, dynamic> json) {
    return TouristSite(
      touristSitesId: json['touristSitesId'] as int,
      touristSitesName: json['touristSitesName'] as String,
      touristSitesDescription: json['touristSitesDescription'] as String,
      photoUrl: json['photo_url'] as String,
      category: json['category'] as String,
      lan: json['lan'] as double,
      lon: json['lon'] as double,
    );
  }
}
