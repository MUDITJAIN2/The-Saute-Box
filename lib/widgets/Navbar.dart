import 'package:flutter/material.dart';
import 'package:sautebox/util/Constants.dart';
import 'package:responsive_builder/responsive_builder.dart';
class NavBar extends StatefulWidget {
  const NavBar();

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: buildMobileNavBar(),
      desktop: buildDesktopNavBar(),
    );
  }

  Widget buildMobileNavBar() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.menu),
              navLogo(),
            ],
          ),
        ),
        // Display HomeBody for mobile
      ],
    );
  }

  Widget buildDesktopNavBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 70,
      child: Row(
        children: [
          navLogo(),
          const Text("The Saute Box"),
        ],
      ),
    );
  }

  Widget navLogo() {
    return Container(
      width: 110,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(logo)),
      ),
    );
  }
}
