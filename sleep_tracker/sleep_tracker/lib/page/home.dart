import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sleep_tracker/page/explore_page.dart';
import 'package:sleep_tracker/page/accountAccess/logout_page.dart';
import 'package:sleep_tracker/page/sleep_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page_location = 0;

  @override
  void initState() {
    int page_location = 0;
  }

  Widget _bodyWidget() {
    switch (page_location) {
      case 0:
        return sleepPage();
        break;
      case 1:
        return explorePage();
        break;
    }
    return Container(
      color: Colors.black,
    );
  }

  Widget _bottomNavigatorWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(color: Colors.black)),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.king_bed,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.king_bed,
                color: Colors.white,
              ),
              label: '수면',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.explore,
                color: Colors.white,
              ),
              label: '탐험',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
              label: '매일',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.pie_chart,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.pie_chart,
                color: Colors.white,
              ),
              label: '통계',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              label: '프로필',
            ),
          ],
          currentIndex: page_location,
          onTap: _onBottomNavigatorBarTapped,
        ),
      ),
    );
  }

  void _onBottomNavigatorBarTapped(int index) {
    setState(() {
      page_location = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return logoutPage();
          } else {
            return _bodyWidget();
          }
        },
      ),
      bottomNavigationBar: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _bottomNavigatorWidget();
          } else {
            return logoutPage();
          }
        },
      ),
    );
  }
}
