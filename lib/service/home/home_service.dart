import 'dart:convert';

import 'package:dio/dio.dart';

import '../../model/home/home_service.dart';
import 'package:http/http.dart' as http;


class ApiService{
  Future<TouristSitesResponse> getList() async{
    try {
      final response = await http.get(Uri.parse("https://327b-125-166-118-235.ngrok-free.app/home"));
      if (response.statusCode == 200) {
        return TouristSitesResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception("something went wrong");
      }
    } catch (e) {
      throw Exception("something went wrong");
    }
  }
}

// void fetchTouristSites() async {
//   Dio dio = Dio();
//   String apiUrl = 'https://327b-125-166-118-235.ngrok-free.app/home';
//
//   try {
//     Response response = await dio.get(apiUrl);
//
//     if (response.statusCode == 200) {
//       // API request successful
//       // Parse the response data using the generated Dart classes
//       TouristSites touristSites = TouristSites.fromJson(response.data);
//
//       // Access the parsed data
//       print(touristSites.message);
//       for (TouristSite site in touristSites.touristSites) {
//         print(site.touristSitesName);
//         print(site.touristSitesDescription);
//         // Access other properties as needed
//       }
//     } else {
//       // API request failed
//       print('Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     // Error occurred during the API request
//     print('Error: $e');
//   }
// }
