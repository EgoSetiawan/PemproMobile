import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pariwisata_flutter/model/delete_model.dart';
import 'package:pariwisata_flutter/view/screen/editScreen.dart';
import 'package:pariwisata_flutter/view/screen/loginScreen.dart';

import '../../model/detail/detail_model.dart';
import 'package:http/http.dart' as http;


class ProfileScreen extends StatefulWidget {
  final String userId;
  ProfileScreen({required this.userId});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = '';
  String photoUrl = '';


  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    try {
      final response = await getUser(widget.userId);
      setState(() {
        username = response.loginResult.namalengkap;
        photoUrl = response.loginResult.profile;
      });
    } catch (e) {

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(photoUrl),
            ),
            SizedBox(height: 20),
            Text(
              username,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EditScreen(userId: widget.userId,)),
                  );
                }
                )
                ;
              },
              child: Text('Edit Profil'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                deleteUser(widget.userId);
              },
              child: Text('Hapus Akun'),
            ),
          ],
        ),
      ),
    );
  }

  Future<DetailResponse> getUser(String userId) async {
    try {
      final response = await http.get(Uri.parse("https://ff6f-114-125-77-36.ngrok-free.app/user/getId/$userId"));
      if (response.statusCode == 200) {
        return DetailResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception("something went wrong");
      }
    } catch (e) {
      throw Exception("something went wrong");
    }
  }
  Future<DeleteResponse> deleteUser(String userId) async {
    try {
      final response = await http.delete(Uri.parse("https://ff6f-114-125-77-36.ngrok-free.app/user/delete/$userId"));
      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
        return DeleteResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception("something went wrong");
      }
    } catch (e) {
      throw Exception("something went wrong");
    }
  }


}


