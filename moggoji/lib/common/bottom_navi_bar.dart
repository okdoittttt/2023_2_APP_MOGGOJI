import 'package:flutter/material.dart';
import 'package:moggoji/pages/event_page.dart';
import 'package:moggoji/pages/notice_page.dart';
import 'package:moggoji/pages/survey_page.dart';
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
        backgroundColor: Colors.deepPurpleAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: seletedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.pending_actions), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: ''),
        ],
        onTap: (int index){
          if(index == 0){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
          } else if(index == 1){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EventPage()));
          } else if(index == 2){
            Navigator.push(context, MaterialPageRoute(builder: (context) => NoticePage()));
          } else if(index == 3){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SurveyPage()));
          }else if(index == 4){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MorePage()));
          }
        },
      ),
    );
  }
}
