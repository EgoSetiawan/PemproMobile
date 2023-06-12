import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pariwisata_flutter/theme/theme.app.dart';

class AppBarWidgets extends StatelessWidget implements PreferredSize {
  const AppBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.blue,
      // title: Text('aww'),
      // title: SvgPicture.asset('assets/icon_touring_jember.svg'),
      actions: [
        SizedBox(
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icon_touring_jember.svg',
              width: 10,
              height: 10,
              color: Colors.white,
            ),
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
