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
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    JwtTokenUtil jwtTokenUtil = JwtTokenUtil();
    String? token = await jwtTokenUtil.loadToken();

    if (token != null) {
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      int userNumber = decodedToken["number"];
      String userId = decodedToken["id"];
      String userEmail = decodedToken["email"];
      String userName = decodedToken["name"];
      String userGender = decodedToken["gender"];
      int userImgNumber = decodedToken["imageNumber"];
      setState(() {
        this.userName = userName;
        this.userNumber = userNumber;
      });
    }
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
