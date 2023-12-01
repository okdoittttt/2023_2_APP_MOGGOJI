import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/items/notice_listView.dart';
import 'package:moggoji/pages/detail/regist_notice_page.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  // TabBar Keyword
  String documentName = '주요공지';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 78.0),
                  child: Text("공지 사항"),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistNoticePage()));
                    },
                    child: Text("등록", style: TextStyle(fontSize: 15))
                )
              ],
            )),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x33000000),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 12, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                          size: 24,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                              width: 200,
                              child: TextFormField(
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Search listings...',
                                  filled: false,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: TabBar(
                          mouseCursor: null,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.black,
                          tabs: [
                            Tab(
                              text: '주요공지',
                              icon: Icon(
                                Icons.receipt_long,
                              ),
                            ),
                            Tab(
                              text: '인원모집',
                              icon: Icon(
                                Icons.group,
                              ),
                            ),
                            Tab(
                              text: '정보공유',
                              icon: Icon(
                                Icons.lightbulb,
                              ),
                            ),
                          ],
                          onTap: (index) {
                            if(index == 0) {
                              setState(() {
                                documentName = '주요공지';
                              });
                            } else if(index == 1) {
                              setState(() {
                                documentName = '인원모집';
                              });
                            } else {
                              setState(() {
                                documentName = '정보공유';
                              });
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ), // TabBar()와 TabBarView 사이 거리 조정
                      Expanded(
                        child: TabBarView(
                          children: [
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 1, // 데이터 개수에 맞게 조정
                              itemBuilder: (context, index) {
                                return NoticeListView(documentName: documentName);
                              },
                            ),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 1, // 데이터 개수에 맞게 조정
                              itemBuilder: (context, index) {
                                return NoticeListView(documentName: documentName);
                              },
                            ),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 1, // 데이터 개수에 맞게 조정
                              itemBuilder: (context, index) {
                                return NoticeListView(documentName: documentName);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNaviBar(),
      ),
    );
  }
}
