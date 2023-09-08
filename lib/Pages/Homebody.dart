import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sautebox/Pages/Second.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20), // Add space between the Text and Row
          const Text(
            'Please Select Lunch or Dinner or Both',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center, // Center align the text
          ),
          const SizedBox(height: 20), // Add more space below the text
          Padding(
            padding: const EdgeInsets.only(left: 480.0),
            child: Row(
              children: <Widget>[
                buildContainerWithDot(1, 'Lunch'),
                const SizedBox(width: 10), // Add space between the containers
                buildContainerWithDot(2, 'Dinner'),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add your onPressed logic here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(),
                      ),
                    );
                  },
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMobileLayout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Hello',
            style: TextStyle(
              fontSize: 16, // Adjust font size for mobile
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10), // Add smaller space for mobile
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            // You can customize this container's contents as needed
          ),
          const SizedBox(height: 10), // Add smaller space for mobile
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            // You can customize this container's contents as needed
          ),
        ],
      ),
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
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 300,
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
          Text(
            text,
            style: const TextStyle(
              fontSize: 16, // Adjust the font size as needed
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
