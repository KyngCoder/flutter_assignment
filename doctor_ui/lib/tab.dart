import 'package:doctor_ui/home_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  // void _changeNav() {
  //   setState(() {
  //     index++;
  //   });
  // }

  List<Widget> itemScreens = [
   HomeScreen(),
    Center(
      child: Text("Calendar"),
    ),
    Center(
      child: Text("Chat"),
    ),
    Center(
      child: Text("User Profile"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: itemScreens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        elevation: 40,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        iconSize: 28,
      ),
    );
  }
}
