import 'package:flutter/material.dart';
import 'package:sautebox/Pages/Homebodyy.dart';
import 'package:sautebox/util/Constants.dart';
import 'package:sautebox/widgets/Navbar.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width; // defining constants in widget build
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const NavBar(), // Place NavBar before the Container
              const SizedBox(height: 20), // Add spacing between NavBar and HomeBody
              Row(
                children: [
                  Column(
                    children: [
                      const Text("Meal Time"),
                      const SizedBox(height: 40),
                      HomeBodyy(),
                      const SizedBox(height: 40),
                      const Text("Meal Type"),
                      const SizedBox(height: 40),
                      HomeBodyy(),
                    ],
                  ),
                   // Add some spacing between the HomeBody and the line
                 Padding(
                   padding: const EdgeInsets.only(left:350.0),
                   child: Container(
                       width: 0.8, // Adjust the width of the line as needed
                       height: 450, // Adjust the height of the line as needed
                       color: Colors.black, // Line color
                        ),
                 ),
                ],
              ), // Assuming HomeBody is another widget
              
            ],
          ),
        ),
      ),
    );
  }
}
