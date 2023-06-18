import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pariwisata_flutter/view/screen/home.screen.dart';
import 'package:pariwisata_flutter/view/screen/searchScreen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '../screen/profilScreen.dart';
import '../screen/registerScreen.dart';

class BottomNavigation extends StatefulWidget {
  final String userId;
  const BottomNavigation({super.key,required this.userId});

  @override
  State<BottomNavigation> createState() => _BottomNavigationScreen();
}

class _BottomNavigationScreen extends State<BottomNavigation> {
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [HomeScreen(), SearchScreen(), ProfileScreen(userId: widget.userId,)],
          ),
          bottomNavigationBar: WaterDropNavBar(
            backgroundColor: Colors.white,
            waterDropColor: Colors.green,
            onItemSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
              pageController.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad);
            },
            selectedIndex: selectedIndex,
            barItems: [
              BarItem(
                filledIcon: Icons.home_rounded,
                outlinedIcon: Icons.home_outlined,
              ),
              BarItem(
                  filledIcon: Icons.search_rounded,
                  outlinedIcon: Icons.search_outlined),
              BarItem(
                filledIcon: Icons.person_3_rounded,
                outlinedIcon: Icons.person_3_outlined,
              ),
            ],
          ),
        ));
  }
}
