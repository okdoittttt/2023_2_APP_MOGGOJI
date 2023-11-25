import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:moggoji/service/attendanceService.dart';

import '../models/schedule.dart';
import '../service/globals.dart';

class ListViewPage extends StatefulWidget {
  final String userName;
  final int userNumber;
  const ListViewPage(
      {Key? key, required this.userName, required this.userNumber})
      : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Schedule> schedules = [];
  int enrollNum = 0;
  int randomNumberTest = 0;

  @override
  void initState() {
    fetchSchedules();
    super.initState();
  }

  // 데이터를 가져 올 함수 정의
  Future<void> fetchSchedules() async {
    final response = await http.get(Uri.parse(TaskbaseURL));

    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final List<dynamic> data = jsonDecode(responseBody);
      print(response.body);
      setState(() {
        schedules = data.map((json) => Schedule.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load schedules');
    }
  }

  Future<void> joinSchedule(String postURL) async {
    final response = await http.post(Uri.parse(postURL));
    if(response.statusCode == 200) {
      // 여기에 성공시 반환할 값 정의
    }

  }

  Future<void> generateRandomNumber() async {
    final response = await http.get(Uri.parse(generateNumber));
    int randomNumber = 0;
    if (response.statusCode == 200) {
      randomNumber = json.decode(response.body);
    }

    setState(() {
      randomNumberTest = randomNumber;
    });
  }

  // 출석등록 (변수이름 잘 못 설정함)
  Future<void> postNumber(String postURL) async {
    final response = await http.post(Uri.parse(postURL));
  }

  String resultName = '';
  int enteredNumber = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal),
      itemCount: schedules.length,
      itemBuilder: (BuildContext context, int index) {
        final schedule = schedules[schedules.length - index - 1];
        DateTime currentDate = DateTime.now();
        DateTime scheduleDate = DateTime.parse(schedule.date);
        Duration differenceDate = scheduleDate.difference(currentDate);

        print("=================================");
        print('${schedule.title} : $differenceDate');

        String dDayText = '';
        if (differenceDate.inDays == 0 &&
            scheduleDate.day - currentDate.day == 1) {
          dDayText = 'D-1';
        } else if (differenceDate.inDays > 0) {
          dDayText = 'D-${(differenceDate.inHours / 24).round()}';
        } else if (differenceDate.inDays == 0 &&
            scheduleDate.day - currentDate.day == 0) {
          dDayText = 'D-Day';
        } else {
          dDayText = 'D+${-(differenceDate.inHours / 24).round()}';
        }

        String weekDayText = '';
        switch (scheduleDate.weekday) {
          case 1:
            weekDayText = '월';
            break;
          case 2:
            weekDayText = '화';
            break;
          case 3:
            weekDayText = '수';
            break;
          case 4:
            weekDayText = '목';
            break;
          case 5:
            weekDayText = '금';
            break;
          case 6:
            weekDayText = '토';
            break;
          default:
            weekDayText = '일';
            break;
        }
        return Container(
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.blueAccent.shade100,
                    blurRadius: 5,
                    offset: Offset(2.2, 2.2))
              ]),
          margin: EdgeInsets.fromLTRB(18, 10, 18, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 60,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${DateFormat("MM/dd").format(DateTime.parse(schedule.date))}($weekDayText)',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              /* JSON 날짜 데이터 - 오늘 날짜 */
                              child: Text(
                                dDayText,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            schedule.title,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2),
                          ),
                        ),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // 참여 기능 ... (모달창 미구현) awit가 안됨. -> response의 statusCode를 확인할 수 없음.
                        String recordNameURL =
                            "$recordName/${schedule.number}/${widget.userName}";
                        joinSchedule(recordNameURL);
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                      child: Text("참여"),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 248,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                            child: ListTile(
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: -4),
                              leading: Text(
                                "날짜",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              // title: Text(schedule.date),
                              title: Text(
                                '${DateFormat("yy-MM-dd").format(DateTime.parse(schedule.date))}($weekDayText) ${DateFormat("HH:mm").format(DateTime.parse(schedule.date))}',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListTile(
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: -4),
                              leading: Text(
                                "장소",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              title: Text(schedule.location),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListTile(
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: -4),
                              leading: Text(
                                "내용",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              title: Text(schedule.content),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListTile(
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: -4),
                              leading: Text(
                                "금액",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              title: Text(schedule.fee.toString()),
                            ),
                          ),
                          /* 추후 DB에서 인원 수 가져올 예정 */
                          SizedBox(
                            height: 30,
                            child: ListTile(
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: -4),
                              leading: Text(
                                "참여",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              title: Text("${schedule.participantName}"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (widget.userNumber == 0) {
                            generateRandomNumber();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("출석번호 생성"),
                                    content: Text(
                                      "${randomNumberTest}",
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("닫기"),
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            String postURL = "${attendance}/${schedule.number}/${widget.userName}";
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("출석번호 생성"),
                                    content: TextField(
                                      onChanged: (val) {
                                        enteredNumber = int.tryParse(val) ?? 0;
                                      },
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Attendance attendace = Attendance();
                                          attendace.checkNumber(enteredNumber, postURL);
                                          // checkNumber(enteredNumber, postURL);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("출석번호 확인"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("취소"),
                                      ),
                                    ],
                                  );
                                });
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0)))),
                        child: Text("출석")),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}