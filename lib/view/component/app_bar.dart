import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidgets extends StatelessWidget implements PreferredSize {
  const AppBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      // title: Text('aww'),
      // title: SvgPicture.asset('assets/icon_touring_jember.svg'),
      actions: [
        SizedBox(
          height: 18.0,
          width: 18.0,
          child: IconButton(
            icon: SvgPicture.asset('assets/icon_touring_jember.svg'),
            onPressed: () => {},
          ),
        )
      ],
      // leading: SvgPicture.asset(''),
    ));
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
