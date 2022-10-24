import "package:flutter/material.dart";
import 'package:zoom_lite/resources/auth_methods.dart';
import 'package:zoom_lite/screens/meetings_history_screen.dart';
import 'package:zoom_lite/screens/meetings_screen.dart';
import 'package:zoom_lite/utils/colors.dart';
import 'package:zoom_lite/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingsScreen(),
    const MeetingsHistoryScreen(),
    CustomButton(text: "Log out", onPressed: () => AuthMethods().signOut(),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text("Meet and Chat"),
        centerTitle: true, // this is required for android (title is in center by default in ios)
      ),

      body: pages[_page],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank,),
            label: "Meet and Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: "Meetings",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: "Settings",
          ),
        ]
      ),
    );
  }
}

