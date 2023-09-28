// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("설문조사"),
      ),
      body: Text("this is survey page"),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
