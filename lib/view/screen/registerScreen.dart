import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../component/app_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidgets(),
      body: Card(
        child: Column(
          children: <Widget>[
            const Text("PENDAFTARAN AKUN"),

            const Text("Name Lengkap"),
            SizedBox(
              width: 400,
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const Text("Email"),
            SizedBox(
              width: 400,
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const Text("Password"),
            SizedBox(
              width: 400,
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "TOMBOL DI KLIK",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM);
                },
                child: Text("Daftar")),
            TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "TOMBOL DI KLIK",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM);
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}