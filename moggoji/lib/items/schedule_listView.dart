import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/schedule.dart';
import '../service/globals.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Schedule> schedules = [];

  /* JSON 데이터 */
  var eventList = [
    {
      "title":"아이디어 발표",
      "date":"2023.09.15. 18:30",
      "location":"누리관 2318호",
      "description":"아이디어 발표",
      "participationFee":"없음",
      "numberOfParticipant":"33",
      "finish":"no",
    },
    {
      "title":"노션 세미나",
      "date":"2023.09.12. 19:00",
      "location":"향파관",
      "description":"노션 사용법 강의",
      "participationFee":"의지",
      "numberOfParticipant":"35",
      "finish":"yes",
    },
    {
      "title":"깃 세미나",
      "date":"2023.09.11. 19:00",
      "location":"향파관",
      "description":"Git CLI 사용법 강의",
      "participationFee":"열정",
      "numberOfParticipant":"30",
      "finish":"yes",
    },
    {
      "title":"개강총회",
      "date":"2023.09.08. 18:30",
      "location":"창의관 303호",
      "description":"개강총회",
      "participationFee":"패기",
      "numberOfParticipant":"55",
      "finish":"yes",
    },
    {
      "title":"개강총회",
      "date":"2023.09.08. 18:30",
      "location":"창의관 303호",
      "description":"개강총회",
      "participationFee":"패기",
      "numberOfParticipant":"55",
      "finish":"yes",
    },
  ];

  @override
  void initState() {
    super.initState();
    fetchSchedules();
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal),
      itemCount: schedules.length,
      itemBuilder: (BuildContext context, int index) {
        final schedule = schedules[index];
        DateTime currentDate = DateTime.now();
        DateTime scheduleDate = DateTime.parse(schedule.date);
        Duration diffrenceDate = scheduleDate.difference(currentDate);

        print("=================================");
        print("=================================");
        print("=================================");
        print(diffrenceDate);

        String dDayText;
        if(diffrenceDate.inDays > 0) {
          dDayText = 'D-${diffrenceDate.inDays}';
        } else if (diffrenceDate.inDays == 0) {
          dDayText = 'D-Day';
        } else {
          dDayText = 'D+${-diffrenceDate.inDays}';
        }

        return Container(
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.deepPurpleAccent.shade100,
                    blurRadius: 5,
                    offset: Offset(2.2, 2.2)
                )
              ]
          ),
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
                            Text(DateFormat("MM-dd").format(DateTime.parse(schedule.date)),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2
                              ),),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              /* JSON 날짜 데이터 - 오늘 날짜 */
                              child: Text(dDayText,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.redAccent,
                                ),),
                            ),
                          ],),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 5, 0, 0),
                          child: Text(schedule.title,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: eventList[index]['finish'] == "yes"
                          ? null
                          : () {},
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          )
                      ),
                      child: Text("참여"),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      child: ListTile(
                        visualDensity: VisualDensity(
                            horizontal: 0, vertical: -4),
                        leading: Text("날짜",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        // title: Text(schedule.date),
                        title: Text(DateFormat("yyyy-MM-dd").format(DateTime.parse(schedule.date)),),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: ListTile(
                        visualDensity: VisualDensity(
                            horizontal: 0, vertical: -4),
                        leading: Text("장소",
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
                        visualDensity: VisualDensity(
                            horizontal: 0, vertical: -4),
                        leading: Text("내용",
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
                        visualDensity: VisualDensity(
                            horizontal: 0, vertical: -4),
                        leading: Text("금액",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        title: Text(schedule.fee.toString()),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: ListTile(
                        visualDensity: VisualDensity(
                            horizontal: 0, vertical: -4),
                        leading: Text("참여",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        title: Text(
                            "${eventList[index]['numberOfParticipant']!} 명"),
                      ),
                    ),
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
