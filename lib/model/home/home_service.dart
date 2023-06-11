class TouristSitesResponse {
  bool error;
  String message;
  List<TouristSite> touristSites;

  TouristSitesResponse({required this.error, required this.message, required this.touristSites});

  factory TouristSitesResponse.fromJson(Map<String, dynamic> json) {
    return TouristSitesResponse(
      error: json['error'],
      message: json['message'],
      touristSites: List<TouristSite>.from(
        json['touristSites'].map((x) => TouristSite.fromJson(x)),
      ),
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
      touristSitesId: json['touristSitesId'],
      touristSitesName: json['touristSitesName'],
      touristSitesDescription: json['touristSitesDescription'],
      photoUrl: json['photo_url'],
      category: json['category'],
      lan: json['lan'].toDouble(),
      lon: json['lon'].toDouble(),
    );
  }
}
