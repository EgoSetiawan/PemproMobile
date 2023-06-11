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

  Future<UserResponse>? _registerFuture;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assests/diatas_gunung.png'),
                fit: BoxFit.cover)),
        child: SizedBox(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 940,
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
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Text("Nama Lengkap"),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left:8),
                        child: TextField(
                          controller: _fullName,
                        ),
                      ),
                    ),
                    const Text("Email"),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 1
                          ),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left:8),
                        child: TextField(
                          controller: _email,
                        ),
                      ),
                    ),
                    const Text("Password"),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 1
                          ),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left:8),
                        child: TextField(
                          controller: _password,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _registerFuture = doRegister(_fullName.text, _email.text, _password.text);
                          });


                        },
                        style: ElevatedButton.styleFrom(
                          primary: greenColor,
                          onPrimary: Colors.white,
                        ),
                        child: const SizedBox(
                            width: double.infinity, // Mengatur lebar Container agar mengisi seluruh parent
                            child: Center(
                              child: Text("Daftar"),
                            )
                        ),
                      ),
                    ),
                    if(_registerFuture != null)
                      FutureBuilder<UserResponse>(
                        future: _registerFuture,
                        builder:(context,snapshot){
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return const Center(child: CircularProgressIndicator());
                          }else if(snapshot.hasError){
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else {
                            final user = snapshot.data!.message;
                            Fluttertoast.showToast(
                                msg: user,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SecondScreen()),
                            );
                            return SizedBox.shrink();
                          };
                        },
                      ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: _email.text,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: greenColor,
                          onPrimary: Colors.white,
                        ),
                        child: Container(
                            width: double.infinity, // Mengatur lebar Container agar mengisi seluruh parent
                            child: Center(
                              child: Text("Login"),
                            )
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ),
          ),
        ));
  }

  Future<UserResponse> doRegister(String name,String email , String password) async{
    try {
      Map<String,dynamic> requestBody ={
        'fullname' :name, 'email' : email , 'password' :password
      };
      final response = await http.post(Uri.parse("https://732a-125-166-118-148.ngrok-free.app/register"),body: requestBody);
      if (response.statusCode == 200) {
        return UserResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception("something went wrong HEHE");
      }
    } catch (e) {
      throw Exception("something went wrong KCCAK");
    }
  }
}
