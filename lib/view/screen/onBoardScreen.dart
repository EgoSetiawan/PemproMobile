import 'package:flutter/material.dart';
import 'package:pariwisata_flutter/view/component/app_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                    image: AssetImage('assests/gunung_biru.png'),
                    fit: BoxFit.cover)),
            child: SizedBox(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      const Text(
                          "Jember adalah kota yang kaya akan keindahan alam dan budaya."),
                      const Text(
                          "Apa jenis wisata yang Anda sukai? Saya bisa membantu memberikan rekomendasi tempat wisata yang sesuai dengan preferensi Anda."),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
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
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
