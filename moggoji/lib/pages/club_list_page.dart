import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';

class ClubListPage extends StatefulWidget {
  const ClubListPage({super.key});

  @override
  State<ClubListPage> createState() => _ClubListPageState();
}

class _ClubListPageState extends State<ClubListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MOGGOJI"),
        centerTitle: true,
      ),
      body: Text("Club List Page"),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
