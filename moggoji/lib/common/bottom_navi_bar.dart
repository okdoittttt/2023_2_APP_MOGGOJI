import 'package:flutter/material.dart';
import 'package:moggoji/pages/main_screen.dart';
import 'package:moggoji/pages/more_page.dart';

class BottomNaviBar extends StatelessWidget {
  // const BottomNaviBar({super.key});
  // 바텀 내비 바 선택 인덱스
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
          if(index == 0){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
          } else if(index == 1){

          } else if(index == 2){

          } else if(index == 3){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MorePage()));
          }
        },
      ),
    );
  }
}
