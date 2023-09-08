import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeBodyy extends StatefulWidget {
  @override
  _HomeBodyyState createState() => _HomeBodyyState();
}

class _HomeBodyyState extends State<HomeBodyy> {
  bool isDotBlue1 = false;
  bool isDotBlue2 = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isDesktop) {
          // Desktop layout
          return buildDesktopLayout();
        } else {
          // Mobile layout
          return buildMobileLayout();
        }
      },
    );
  }

  Widget buildDesktopLayout() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 80.0),
        child: Row(
          children: [
            buildContainerWithDot(1, 'Lunch'), // Different text for the first container
            const SizedBox(width: 10), // Add space between the containers
            buildContainerWithDot(2, 'Dinner'), // Different text for the second container
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout() {
    return Row(
      children: [
        Container(
          width: 100,
          height: 150,
          color: Colors.grey,
          // You can customize this container's contents as needed
        ),
        const SizedBox(width: 10), // Add smaller space for mobile
        Container(
          width: 100,
          height: 150,
          color: Colors.grey,
          // You can customize this container's contents as needed
        ),
      ],
    );
  }

  Widget buildContainerWithDot(int containerNumber, String text) {
    bool isDotBlue = containerNumber == 1 ? isDotBlue1 : isDotBlue2;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (containerNumber == 1) {
            isDotBlue1 = !isDotBlue1;
          } else {
            isDotBlue2 = !isDotBlue2;
          }
        });
      },
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 150,
            color: Colors.grey,
            // You can customize this container's contents as needed
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 10, // Adjust the size of the dot as needed
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDotBlue ? Colors.blue : Colors.white,
              ),
            ),
          ),
          Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
