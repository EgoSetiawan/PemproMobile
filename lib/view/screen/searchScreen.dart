import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/search/serach_model.dart';
import '../component/app_bar.dart';
import 'detailScreen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      searchKeyword = searchController.text;
                    });
                  },
                  child: Text('Search'),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<SearchResponse>(
              future: getList(searchKeyword: searchKeyword),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  List<TouristSite> touristSiteResult = snapshot.data!.touristSites;
                  return ListView.builder(
                    itemCount: touristSiteResult.length,
                    itemBuilder: (context, index) {
                      print(touristSiteResult[index].touristSitesName);
                      return Container(
                        child: Card(
                          child: InkWell(
                            onTap: () async {

                            },
                            child: Stack(
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.transparent, Colors.black],
                                      stops: [0.7, 1.0],
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.darken,
                                  child: Image.network(
                                    touristSiteResult[index].photoUrl,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                Positioned(
                                  bottom: 16,
                                  left: 16,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        touristSiteResult[index].touristSitesName,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        touristSiteResult[index].category,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
  Future<SearchResponse> getList({String? searchKeyword}) async {
    try {
      final response = await http.get(Uri.parse(
          "https://ff6f-114-125-77-36.ngrok-free.app/home/search?search=$searchKeyword"));
      if (response.statusCode == 200) {
        return SearchResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception("something went wrong");
      }
    } catch (e) {
      throw Exception("something went wrong");
    }
  }
}



