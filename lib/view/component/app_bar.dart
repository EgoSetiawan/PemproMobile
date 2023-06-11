import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidgets extends StatelessWidget implements PreferredSize {
  const AppBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Touring Jember Nuel"),
      leading: IconButton(
        icon: SvgPicture.asset("../assests/icon_touring_jember.svg"),
        onPressed: (){},
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
