import 'package:flutter/material.dart';
import 'package:pariwisata_flutter/view/screen/firstOnBoardScreen.dart';
// import 'package:pariwisata_flutter/view/screen/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HOME",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        fontFamily: "Poppins",
        useMaterial3: true,
      ),
      home: FirstOnBoardScreen(),
    );
  }
}
