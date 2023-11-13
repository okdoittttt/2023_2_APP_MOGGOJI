import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:moggoji/items/schedule_main_screen.dart';
import 'package:moggoji/items/show_dialog_regist_survey.dart';
import 'package:moggoji/pages/detail/regist_event_page.dart';
import 'package:moggoji/pages/detail/regist_notice_page.dart';
import 'package:moggoji/pages/event_page.dart';
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
      appBar: AppBar(
        /* title -> 관리자가 정하는 모꼬지 이름을 DB에서 가져와서 보여줄 예정 */
        title: Text("MOGGOJI"),
        // 뒤로가기 버튼 없애기 -> 로그인 구현 후 적용할 예정
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/mainImg.jpg',
              width: MediaQuery.sizeOf(context).width,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /* 행사등록 버튼 -> 관리자 권한이 있는 사람한 테만 사용가능 또는 사라지게 할 예정 */
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistEventPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.white,
                          shadowColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text(
                        "행사 등록",
                        style: TextStyle(letterSpacing: 1, color: Colors.black),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistNoticePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.white,
                          shadowColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text(
                        "공지 등록",
                        style: TextStyle(letterSpacing: 1, color: Colors.black),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ShowDialogRegistSurvey();
                              });
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.white,
                          shadowColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text(
                        "설문 등록",
                        style: TextStyle(letterSpacing: 1, color: Colors.black),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
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
                  Expanded(
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
                  Expanded(
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
                  Expanded(
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
                  Expanded(
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
                  Expanded(
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Icon(Icons.notifications),
                          title: Text(
                            "공지사항",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2),
                          ),
                          trailing: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NoticePage()));
                            },
                            child: Text(
                              "더보기",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ListTile(
                      title: Text("개강총회 안내"),
                      trailing: Text("2023.09.08."),
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Icon(Icons.people_alt),
                          title: Row(
                            children: [
                              Text(
                                "모꼬지 참여자",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "(76명)",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          trailing: TextButton(
                            onPressed: () {},
                            child: Text(
                              "더보기",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      height: 40,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("프로필1"),
                          Text("프로필2"),
                          Text("프로필3"),
                          Text("프로필4"),
                          Text("프로필5"),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Icon(Icons.pending_actions),
                          title: Text(
                            "등록된 설문",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2),
                          ),
                          trailing: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SurveyPage()));
                              },
                              child: Text(
                                "더보기",
                                style: TextStyle(color: Colors.grey),
                              )),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ListTile(
                      title: Text("깃 세미나 만족도"),
                      trailing: Text("2023.09.11."),
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ListTile(
                      title: Text("노션 세미나 만족도"),
                      trailing: Text("2023.09.12."),
                    ),
                  ),
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
