import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pariwisata_flutter/model/login/login_model.dart';
import 'package:pariwisata_flutter/view/screen/home.screen.dart';
import 'package:pariwisata_flutter/view/screen/registerScreen.dart';
import 'package:pariwisata_flutter/view/screen/secondscreen.dart';

import '../../model/home/home_model.dart';
import '../../model/register/register_model.dart';
import '../../theme/theme.app.dart';
import '../component/app_bar.dart';
import 'package:http/http.dart' as http;

import 'onBoardScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<LoginResponse>? _loginFuture;
  @override
  Widget build(BuildContext context) {
    const Scaffold(appBar: AppBarWidgets());
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assests/images/gunung_biru.png'),
                fit: BoxFit.cover)),
        child: SizedBox(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              width: double.infinity,
              child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 24, left: 18, right: 18, bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Masuk",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "Email",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            )),
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
                        const Text(
                          "Password",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: TextField(
                              controller: _password,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              // setState(() {
                              //   _loginFuture = doLogin(_email.text, _password.text);
                              // });
                              _login();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: greenColor,
                              onPrimary: Colors.white,
                            ),
                            child: const SizedBox(
                                width: double
                                    .infinity, // Mengatur lebar Container agar mengisi seluruh parent
                                child: Center(
                                  child: Text("Login",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        // fontSize: 24,
                                      )),
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
                                      builder: (context) => RegisterScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                            ),
                            child: Container(
                                width: double
                                    .infinity, // Mengatur lebar Container agar mengisi seluruh parent
                                child: Center(
                                  child: Text("Belum mempunyai akun? Daftar",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 12)),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ));
  }

  // Future<LoginResponse> doLogin(String email , String password) async{
  //   try {
  //     Map<String,dynamic> requestBody ={
  //       'email' : email , 'password' :password
  //     };
  //     final response = await http.post(Uri.parse("https://732a-125-166-118-148.ngrok-free.app/login"),body: requestBody);
  //     if (response.statusCode == 200) {
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SecondScreen()),);
  //
  //       return LoginResponse.fromJson(json.decode(response.body));
  //     } else {
  //       throw Exception("something went wrong HEHE");
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //         msg: "something went wrong KOCAK",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM);
  //     throw Exception("something went wrong KCCAK");
  //   }
  // }

  Future<LoginResponse> doLoginx(String email, String password) async {
    try {
      Map<String, dynamic> requestBody = {'email': email, 'password': password};
      final response = await http.post(
          Uri.parse("https://5489-118-99-83-51.ngrok-free.app/auth/login"),
          body: requestBody);
      return LoginResponse.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception("Terjadi kesalahan saat Login");
    }
  }

  Future<void> _login() async {
    try {
      final loginResult = await doLoginx(_email.text, _password.text);

      Fluttertoast.showToast(
        msg: loginResult.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      if (!loginResult.error) {
        // await UserSimplePreferences.setUsername(loginResult.loginResult.userId);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SecondScreen()),
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Terjadi kesalahan saat Login",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
