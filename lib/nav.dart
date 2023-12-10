import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class BottomNav extends StatefulWidget {

  @override
  State<BottomNav> createState() => _BottomNavState();

}

final ValueNotifier<bool> isDark = ValueNotifier<bool>(false);

class _BottomNavState extends State<BottomNav> {
  int currentindex = 2;

  List<Widget> screens = [
    CommunityScreen(),
    CommunityScreen(),
    CommunityScreen(),
    CommunityScreen(),
    CommunityScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Row(
            children: [
              Text(
                "Chat Screen",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(
              Icons.brightness_medium_rounded,
            ),
          ),
        ],
      ),
      body: screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentindex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline_rounded),
            label: "vedios",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home", // Empty label for the circular button
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: "chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: "news",
          ),
        ],
      ),
    );
  }
}
