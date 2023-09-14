import 'package:flutter/material.dart';

import '../common/bottom_navi_bar.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MOGGOJI"),
        centerTitle: true,
      ),
      body: Text("MORE PAGE"),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
