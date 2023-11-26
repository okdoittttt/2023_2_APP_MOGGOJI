import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';

import '../items/schedule_listView.dart';
import '../service/jwtTokenUnit.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  int userNumber = 0;
  String userName = '';

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  void fetchUserInfo() async {
    JwtTokenUtil jwtTokenUtil = JwtTokenUtil();
    await jwtTokenUtil.getUserInfo();

    setState(() {
      userNumber = jwtTokenUtil.userNumber ?? 0;
      userName = jwtTokenUtil.userName ?? "";
    });
  }

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
      body: ListViewPage(userName: userName, userNumber: userNumber),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
