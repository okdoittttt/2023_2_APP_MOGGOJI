import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MOGGOJI"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
