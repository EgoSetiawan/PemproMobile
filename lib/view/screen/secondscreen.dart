import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pariwisata_flutter/view/component/app_bar.dart';

import '../component/bottom_navigation.dart';

class SecondScreen extends StatefulWidget {
  final String userId;

  const SecondScreen({Key? key,required this.userId}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets(),
      bottomNavigationBar: BottomNavigation(userId: widget.userId),
    );
  }
}
