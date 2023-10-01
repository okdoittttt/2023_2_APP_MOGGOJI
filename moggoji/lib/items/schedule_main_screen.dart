import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/schedule.dart';
import '../service/globals.dart';

class MainScreenSchedule extends StatefulWidget {
  const MainScreenSchedule({super.key});

  @override
  State<MainScreenSchedule> createState() => _MainScreenScheduleState();
}

class _MainScreenScheduleState extends State<MainScreenSchedule> {
  List<Schedule> schedules = [];

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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
      child: Container(
        width: double.infinity,
        height: 360,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 5),
          child: ListView.builder(
            itemCount: schedules.length,
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,

            itemBuilder: (BuildContext context, int index) {
              final schedule = schedules[index];

              return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x430F1113),
                          offset: Offset(0, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: 'locationImage',
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://avatars.githubusercontent.com/u/39268032?s=200&v=4',
                                width: double.infinity,
                                height: 220,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Text(
                              schedule.title,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                Text(
                                  schedule.location,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(4, 4, 0, 0),
                                child: Text(
                                  DateFormat("MM-dd").format(DateTime.parse(schedule.date)),
                                  style: TextStyle(
                                    fontSize: 13
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                                size: 24,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
              );
            },
          ),
        ),
      ),
    );
  }
}
