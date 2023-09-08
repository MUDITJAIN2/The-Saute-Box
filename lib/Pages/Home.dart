import 'package:flutter/material.dart';
import 'package:sautebox/util/Constants.dart';
import 'package:sautebox/Pages/Homebody.dart';
import 'package:sautebox/widgets/Navbar.dart';
class Home extends StatefulWidget {
  //class name starts with capital
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width; // defining contants in widget build
    h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
        child: Container(
          child: Column(
           children: [const NavBar(),HomeBody(),],
        )
      ),
    )
    );
  }
}