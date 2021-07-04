import 'package:flutter/material.dart';
import 'package:tussle_app/Events/pages/home_page.dart';
import 'package:tussle_app/MyProfile/myprofile_screen.dart';
import 'package:tussle_app/StartScreen/home.dart';
import 'package:tussle_app/Tournaments/tournament_screen.dart';

class BeforeStart extends StatefulWidget {
  _Go createState() => _Go();
}
class _Go extends State<BeforeStart> {

  final _pages = [
    FirstScreen(),
    TournamentsScreen(),
    EventScreen(),
    MyProfile(),
  ];
  int _selectedPage = 0;
  PageController _pageController = new  PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        children: _pages,
        onPageChanged: (index){
          setState(() {
            _selectedPage = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),  BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_rounded),
            label: '',
          ),  BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: '',
          ),  BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '',
          ),
        ],
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
          _pageController.jumpToPage(index);

        },
        selectedItemColor: Colors.purple,
      ),
    );
  }
}
///test