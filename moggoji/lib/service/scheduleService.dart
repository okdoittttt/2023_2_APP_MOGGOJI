import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moggoji/models/schedule.dart';
import 'package:moggoji/service/globals.dart';


class ScheduleService {
  List<Schedule> schedules = [];
  List<String> userNameList = [];

  // 일정 불러오기
  Future<void> getSchedules() async {
    final reponse = await http.get(Uri.parse(TaskbaseURL));

    await _handleGetScheduleResponse(reponse);
  }

  // 참여
  Future<void> joinSchedule(String postURL) async {
    final response = await http.post(Uri.parse(postURL));

    await _handleJoinScheduleResponse(response);
  }

  // Handler
  // 일정 불러오기 핸들러
  Future<void> _handleGetScheduleResponse(http.Response response) async {
    if(response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final List<dynamic> data = jsonDecode(responseBody);

      schedules = data.map((json) => Schedule.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load schedules");
    }
  }

  // 참여 핸들러
  Future<void> _handleJoinScheduleResponse(http.Response response) async {
    if(response.statusCode == 200) {
      print("참여 성공");
    } else {
      print("참여 실패");
    }
  }

  // 이름 리스트에 옮겨 담기
  Future<void> makeList(String userNames) async {
    userNameList = userNames.split(', ');
  }

}