import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pariwisata_flutter/view/component/app_bar.dart';
import 'package:pariwisata_flutter/view/screen/home.screen.dart';

import '../component/bottom_navigation.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
