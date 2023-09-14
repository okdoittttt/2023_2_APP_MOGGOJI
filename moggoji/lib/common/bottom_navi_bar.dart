import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moggoji/pages/main_screen.dart';

class BottomNaviBar extends StatelessWidget {
  // const BottomNaviBar({super.key});
  int seletedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightBlueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: seletedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Club'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Notice'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: 'More'),
        ],
        onTap: (int index){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()),
          );
        },
      ),
    );
  }
}
