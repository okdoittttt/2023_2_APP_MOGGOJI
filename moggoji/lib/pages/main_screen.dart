import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:moggoji/items/schedule_main_screen.dart';
import 'package:moggoji/items/show_dialog_regist_survey.dart';
import 'package:moggoji/pages/detail/regist_event_page.dart';
import 'package:moggoji/pages/detail/regist_notice_page.dart';
import 'package:moggoji/pages/event_page.dart';
import 'package:moggoji/pages/more_page.dart';
import 'package:moggoji/pages/notice_page.dart';
import 'package:moggoji/pages/survey_page.dart';

import '../common/bottom_navi_bar.dart';
import '../models/schedule.dart';
import '../service/globals.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Schedule> schedule = [];

  @override
  void initState() {
    super.initState();
    fetchSchedule(); // 데이터를 가져 올 함수
  }

  // 데이터를 가져 올 함수 정의
  Future<List<Schedule>> fetchSchedule() async {
    final response = await http.get(Uri.parse(TaskbaseURL));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(response.body);
      return data.map((json) => Schedule.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load schedule');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                'assets/main.jpg',
                width: MediaQuery.sizeOf(context).width,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Text(
                  '소모임 관리 어플',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 16,
                child: Text(
                  'MOGGOJI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ]),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NoticePage()));
                      },
                      child: Column(children: [
                        Icon(
                          Icons.notifications,
                          color: Colors.greenAccent,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text("공지사항"),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(children: [
                        Icon(
                          Icons.people_alt,
                          color: Colors.yellow,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text("참여인원")
                      ]),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SurveyPage()));
                      },
                      child: Column(children: [
                        Icon(
                          Icons.pending_actions,
                          color: Colors.redAccent,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text("설문조사")
                      ]),
                    ),
                  ),
                  Expanded(
                    child: Column(children: [
                      Icon(
                        Icons.link,
                        color: Colors.lightBlue,
                        size: 40,
                      ),
                      SizedBox(height: 10),
                      Text("링크")
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistNoticePage()));
                      },
                      child: Column(children: [
                        Icon(
                          Icons.edit_notifications_sharp,
                          color: Colors.deepPurpleAccent,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text("공지등록"),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistEventPage()));
                      },
                      child: Column(children: [
                        Icon(
                          Icons.receipt_long,
                          color: Colors.teal,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text("행사등록")
                      ]),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ShowDialogRegistSurvey();
                              });
                        });
                      },
                      child: Column(children: [
                        Icon(
                          Icons.pending_actions_sharp,
                          color: Colors.orange,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text("설문등록")
                      ]),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MorePage()));
                      },
                      child: Column(children: [
                        Icon(
                          Icons.account_circle,
                          color: Colors.deepOrangeAccent,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text("더보기")
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.calendar_month_outlined),
                    title: Text(
                      "행사일정",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2),
                    ),
                  ),
                  MainScreenSchedule(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
