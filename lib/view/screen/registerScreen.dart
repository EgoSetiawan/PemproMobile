import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pariwisata_flutter/view/screen/home.screen.dart';
import 'package:pariwisata_flutter/view/screen/secondscreen.dart';

import '../../model/home/home_model.dart';
import '../../model/register/register_model.dart';
import '../../theme/theme.app.dart';
import '../component/app_bar.dart';
import 'package:http/http.dart' as http;

import 'loginScreen.dart';
import 'onBoardScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  // Future<UserResponse>? _registerFuture;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assests/images/diatas_gunung.png'),
                fit: BoxFit.cover)),
        child: SizedBox(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 460,
              width: double.infinity,
              child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Pendaftaran Akun",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text("Nama Lengkap",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: TextField(
                              controller: _fullName,
                            ),
                          ),
                        ),
                        const Text("Email",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16)),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: TextField(
                              controller: _email,

                            ),
                          ),
                        ),
                        const Text("Password",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16)),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: TextField(
                              controller: _password,
                              obscureText: true,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              // setState(() {
                              //   _registerFuture = doRegister(_fullName.text, _email.text, _password.text);
                              // }
                              // )
                              _register();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: greenColor,
                              onPrimary: Colors.white,
                            ),
                            child: const SizedBox(
                                width: double
                                    .infinity, // Mengatur lebar Container agar mengisi seluruh parent
                                child: Center(
                                  child: Text("Daftar"),
                                )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                            ),
                            child: Container(
                                width: double
                                    .infinity, // Mengatur lebar Container agar mengisi seluruh parent
                                child: Center(
                                  child: Text("Belum mempunyai akun? Login",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 12)),
                                )),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ));
  }

  Future<RegisterResponse> doRegisterx(
      String name, String email, String password) async {
    try {
      Map<String, dynamic> requestBody = {
        'namalengkap': name,
        'email': email,
        'password': password
      };
      final response = await http.post(
          Uri.parse("https://b97f-114-125-77-36.ngrok-free.app/auth/register"),
          body: requestBody);
      return RegisterResponse.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception("Terjadi kesalahan saat registrasi");
    }
  }

  Future<void> _register() async {
    try {
      final registerResult =
          await doRegisterx(_fullName.text, _email.text, _password.text);
      Fluttertoast.showToast(
        msg: registerResult.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      if (!registerResult.error) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Terjadi kesalahan saat registrasi",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
