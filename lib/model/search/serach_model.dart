class SearchResponse {
  final bool error;
  final int code;
  final String message;
  final List<TouristSite> touristSites;

  SearchResponse({
    required this.error,
    required this.code,
    required this.message,
    required this.touristSites,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      error: json['error'],
      code: json['code'],
      message: json['message'],
      touristSites: List<TouristSite>.from(
        json['touristSities'].map((site) => TouristSite.fromJson(site)),
      ),
    );
  }
}

class TouristSite {
  final int touristSitesId;
  final String touristSitesName;
  final String touristSitesDescription;
  final String photoUrl;
  final String category;
  final double lan;
  final double lon;

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
      lan: json['lan'],
      lon: json['lon'],
    );
  }
}
