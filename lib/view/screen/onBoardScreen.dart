import 'package:flutter/material.dart';
import 'package:pariwisata_flutter/theme/theme.app.dart';
import 'package:pariwisata_flutter/view/component/app_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pariwisata_flutter/view/screen/loginScreen.dart';
import 'package:pariwisata_flutter/view/screen/registerScreen.dart';
import 'package:pariwisata_flutter/view/screen/secondscreen.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidgets(),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assests/diatas_gunung.png'),
                    fit: BoxFit.cover)),
            child: SizedBox(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 260,
                  child: Card(
                    child: Padding(padding: EdgeInsets.all(20),
                      child:           Column(
                        children: <Widget>[
                          const Text(
                              "Jember adalah kota yang kaya akan keindahan alam dan budaya.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                              "Apa jenis wisata yang Anda sukai? Saya bisa membantu memberikan rekomendasi tempat wisata yang sesuai dengan preferensi Anda."),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child:             Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterScreen()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: greenColor,
                                        onPrimary: Colors.white),
                                  child: const SizedBox(
                                    width: 70,
                                    height: 40,
                                    child: Center(
                                      child: Text("Daftar"),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: greenColor,
                                        onPrimary: Colors.white),
                                    child: const SizedBox(
                                      width: 70,
                                      height: 40,
                                      child: Center(
                                          child: Text("Login"),
                                      ),
                                      ),
                                    )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                ),
              ),
            )
        )
    );
  }
}
