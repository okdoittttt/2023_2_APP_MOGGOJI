import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        title: Text("MOGGOJI"),
        // 뒤로가기 버튼 없애기 -> 로그인 구현 후 적용할 예정
        // automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Text("HOME PAGE"),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
