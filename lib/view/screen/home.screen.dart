import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/home/home_model.dart';
import 'package:http/http.dart' as http;

import '../component/app_bar.dart';
import 'detailScreen.dart';

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
      body: FutureBuilder<HomeResonponse>(
        future: getList(),
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
            List<TouristSite> tourisStiteResult = snapshot.data!.touristSites;
            // Tampilkan data dalam ListView
            return ListView.builder(
              itemCount: tourisStiteResult.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                      child: InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            touristSite: tourisStiteResult[index],
                          ),
                        ),
                      );
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
                            tourisStiteResult[index].photoUrl,
                            fit: BoxFit.cover,
                            height:
                                200, // Sesuaikan tinggi gambar sesuai kebutuhan
                          ),
                        ),
                        Positioned(
                          bottom: 16, // Sesuaikan posisi teks sesuai kebutuhan
                          left: 16, // Sesuaikan posisi teks sesuai kebutuhan
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tourisStiteResult[index].touristSitesName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      18, // Sesuaikan ukuran font sesuai kebutuhan
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                tourisStiteResult[index].category,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      14, // Sesuaikan ukuran font sesuai kebutuhan
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                );
              },
            );
          }
          ;
        },
      ),
    );
  }

  Future<HomeResonponse> getList() async {

    try {
      final response = await http
          .get(Uri.parse("https://ff6f-114-125-77-36.ngrok-free.app/home/all"));
      if (response.statusCode == 200) {
        return HomeResonponse.fromJson(json.decode(response.body));
      } else {
        throw Exception("something went wrong");
      }
    } catch (e) {
      throw Exception("something went wrong");
    }
  }
}
