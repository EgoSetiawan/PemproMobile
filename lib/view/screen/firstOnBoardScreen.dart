import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pariwisata_flutter/view/screen/onBoardScreen.dart';
import 'package:pariwisata_flutter/view/screen/secondscreen.dart';

import '../../theme/theme.app.dart';
import '../component/app_bar.dart';

class FirstOnBoardScreen extends StatelessWidget {
  const FirstOnBoardScreen({Key? key}) : super(key: key);

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
                child: Container(
                  height: 260,
                  child: Card(
                      child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "Bingung Pilih Tempat Wisata di Jember?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                            "Tenang, Anda sedang berada di aplikasi yang tepat untuk mencari informasi mengenai tempat wisata di Jember."),
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => OnBoardScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                onPrimary: Colors.white,
                              ),
                              child: Container(
                                width: double.infinity, // Mengatur lebar Container agar mengisi seluruh parent
                                child: Center(
                                  child: Text("Selanjutnya"),
                                )
                              ),
                            ),
                          )

                        // Row(
                            //   children: [
                            //     ElevatedButton(
                            //         onPressed: () {
                            //           Navigator.push(
                            //               context,
                            //               MaterialPageRoute(
                            //                   builder: (context) =>
                            //                       SecondScreen()));
                            //         },
                            //         style: ElevatedButton.styleFrom(
                            //             primary: greenColor,
                            //             onPrimary: Colors.white),
                            //         child: Text("Daftar")),
                            //     Spacer(),
                            //     ElevatedButton(
                            //         onPressed: () {
                            //           Fluttertoast.showToast(
                            //               msg: "TOMBOL DI KLIK",
                            //               toastLength: Toast.LENGTH_SHORT,
                            //               gravity: ToastGravity.BOTTOM);
                            //         },
                            //         style: ElevatedButton.styleFrom(
                            //             primary: greenColor,
                            //             onPrimary: Colors.white),
                            //         child: Text("Login"))
                            //   ],
                            // ),

                      ],
                    ),
                  )),
                ),
              ),
            )));
  }
}
