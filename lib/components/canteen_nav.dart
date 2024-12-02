import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../pages/canteen/canteen_home_page.dart'; // Import the CanteenHomePage
import '../pages/canteen/modify_item_page.dart'; // Import the ModifyItemPage
import '../pages/canteen/past_orders_page.dart'; // Import the PastOrdersPage

class CanteenNav extends StatefulWidget {
  @override
  _CanteenNavState createState() => _CanteenNavState();
}

class _CanteenNavState extends State<CanteenNav> {
  int currentTabIndex = 0;

  final List<Widget> pages = [
    CanteenHomePage(),
    ModifyItemPage(),
    PastOrdersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.edit_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.history_outlined,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}