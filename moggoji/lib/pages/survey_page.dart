import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/items/show_dialog_regist_survey.dart';
import 'package:moggoji/items/survey_listView.dart';
import 'package:moggoji/items/survey_type_listView.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {

  int surveyType = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 78.0),
                  child: Text("설문 조사"),
                ),
                FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    highlightElevation: 0,
                  onPressed: (){
                    setState(() { showDialog(context: context, builder: (context){
                      return ShowDialogRegistSurvey();
                    });
                    });
                  },
                  child: Text("등록"),
                )
              ],
            )),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* search bar */
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
              /* regist button */
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
                              text: 'All',
                              icon: Icon(
                                Icons.all_inbox,
                              ),
                            ),
                            Tab(
                              text: 'OX',
                              icon: Icon(
                                Icons.check_box_outlined,
                              ),
                            ),
                            Tab(
                              text: 'Form',
                              icon: Icon(
                                Icons.note_alt_outlined,
                              ),
                            ),
                          ],
                          onTap: (index) {
                            if(index == 0) {
                              setState(() {
                              });
                            } else if(index == 1) {
                              setState(() {
                                surveyType = 1;
                              });
                            } else {
                              setState(() {
                                surveyType = 2;
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
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return SurveyListView();
                              },
                            ),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return SurveyTypeListView(surveyType: surveyType);
                              },
                            ),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return SurveyTypeListView(surveyType: surveyType);
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
