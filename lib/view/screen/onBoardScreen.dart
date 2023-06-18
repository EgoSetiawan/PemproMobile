import 'package:flutter/material.dart';
import 'package:pariwisata_flutter/theme/theme.app.dart';
import 'package:pariwisata_flutter/view/component/app_bar.dart';
import 'package:pariwisata_flutter/view/screen/loginScreen.dart';
import 'package:pariwisata_flutter/view/screen/registerScreen.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidgets(),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assests/images/diatas_gunung.png'),
                    fit: BoxFit.cover)),
            child: SizedBox(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 260,
                  child: Card(
                      child: Padding(
                    padding: EdgeInsets.only(
                        top: 24, left: 18, right: 18, bottom: 24),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Container(
                              child: Text(
                                "Jember adalah kota yang kaya akan keindahan alam dan budaya.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text(
                                  "Apa jenis wisata yang Anda sukai? Saya bisa membantu memberikan rekomendasi tempat wisata yang sesuai dengan preferensi Anda.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 12)),
                            )),
                        Expanded(
                            flex: 0,
                            child: Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: Row(
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
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        primary: Color(0xFF198754),
                                        onPrimary: Colors.white),
                                    child: const SizedBox(
                                      width: 70,
                                      height: 40,
                                      child: Center(
                                        child: Text("Daftar",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14)),
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
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        primary: Color(0xFF272735),
                                        onPrimary: Colors.white),
                                    child: const SizedBox(
                                      width: 70,
                                      child: Center(
                                        child: Text("Login",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  )),
                ),
              ),
            )));
  }
}
