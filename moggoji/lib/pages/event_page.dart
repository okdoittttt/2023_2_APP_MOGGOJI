import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';

import '../items/schedule_listView.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 78.0),
              child: Text("행사 일정"),
            ),
            TextButton(onPressed: (){}, child: Text("관리",
                style: TextStyle(fontSize: 15),
              )
            )
          ],
        ),
      ),
      body: ListViewPage(),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
