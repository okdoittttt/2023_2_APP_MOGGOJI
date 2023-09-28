import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("공지사항"),
      ),
      body: Text("this is notice page"),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
