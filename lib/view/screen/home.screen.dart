import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/home/home_model.dart';
import 'package:http/http.dart' as http;

import '../component/app_bar.dart';
import '../component/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidgets(),
        body: FutureBuilder<TouristSitesResponse>(
          future: getList(),
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapshot.hasError){
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else{
              List<TouristSite> tourisStiteResult = snapshot.data!.touristSites;
              // Tampilkan data dalam ListView
              return ListView.builder(
                itemCount: tourisStiteResult.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Card(
                      child: Column(
                        children: [
                          Text(tourisStiteResult[index].touristSitesName),
                          Image.network(tourisStiteResult[index].photoUrl)
                        ],
                      ),
                    ),

                  );
                },
              );
            };
          },
        ),
      // bottomNavigationBar: BottomNavigation(),

    );
  }
  Future<TouristSitesResponse> getList() async{
    try {
      final response = await http.get(Uri.parse("https://732a-125-166-118-148.ngrok-free.app/home"));
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
