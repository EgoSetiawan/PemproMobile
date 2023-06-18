import 'package:flutter/material.dart';

class AppBarWidgets extends StatelessWidget implements PreferredSize {
  const AppBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset("assests/images/icon_touring_jember.png"),
        onPressed: () {},
      ),
      leadingWidth: 70,
      // ignore: prefer_const_constructors
      title: Text(
        "Touring Jember",
        style: const TextStyle(
            color: Color(0xFF198754),
            fontWeight: FontWeight.w400,
            fontSize: 15),
      ),
      titleSpacing: -5,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
