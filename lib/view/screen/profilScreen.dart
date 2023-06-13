import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = 'Nama Pengguna';

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
              backgroundImage: AssetImage('path_to_profile_image'),
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
                  // Tambahkan logika untuk mengedit profil di sini
                  username = 'Nama Pengguna yang Diubah';
                });
              },
              child: Text('Edit Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
