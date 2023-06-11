import 'package:flutter/material.dart';
import 'package:pariwisata_flutter/view/register/register.dart';
// import 'package:pariwisata_flutter/view/component/app_bar.dart';
// import 'package:pariwisata_flutter/view/component/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(),
      home: const RegisterScreen(),
      // appBar: ,
      // appBar: AppBarWidgets(),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
