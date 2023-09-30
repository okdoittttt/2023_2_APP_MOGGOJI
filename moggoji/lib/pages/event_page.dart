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
        title: Text("행사 일정"),
        centerTitle: true,
      ),
      body: ListViewPage(),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
