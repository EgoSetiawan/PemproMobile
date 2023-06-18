import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pariwisata_flutter/view/screen/onBoardScreen.dart';

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
                    image: AssetImage('assests/images/gunung_biru.png'),
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
                            flex: 1,
                            child: Container(
                              height: 20,
                              child: Text(
                                "Bingung Pilih Tempat Wisata di Jember?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              child: Text(
                                "Tenang, Anda sedang berada di aplikasi yang tepat untuk mencari informasi mengenai tempat wisata di Jember.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontWeight: FontWeight.w200, fontSize: 12),
                              ),
                            )),
                        Expanded(
                            flex: 0,
                            child: Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OnBoardScreen()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: Color(0xFF272735),
                                    onPrimary: Colors.white,
                                  ),
                                  child: Container(
                                    width: double
                                        .infinity, // Mengatur lebar Container agar mengisi seluruh parent
                                    child: Center(
                                        child: Text("Selanjutnya",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14))),
                                  )),
                            ))
                      ],
                    ),
                  )),
                ),
              ),
            )));
  }
}
