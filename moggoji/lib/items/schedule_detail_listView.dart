import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../service/scheduleService.dart';

class ScheduleDetailListView extends StatefulWidget {
  final String userNames;

  const ScheduleDetailListView(
      {Key? key, required this.userNames})
      : super(key: key);

  @override
  State<ScheduleDetailListView> createState() => _ScheduleDetailListViewState();
}

class _ScheduleDetailListViewState extends State<ScheduleDetailListView> {
  @override
  void initState() {
    super.initState();
    makeList();
  }

  // 이름 리스트에 옮겨 담기
  List<String> userNamesList = [];
  Future<void> makeList() async {
    ScheduleService scheduleService = ScheduleService();
    scheduleService.makeList(widget.userNames);

    setState(() {
      userNamesList = scheduleService.userNameList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        child: ListView.builder(
          physics: BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
          shrinkWrap: true,
          itemCount: userNamesList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    // top: BorderSide(width: 1.0, color: Colors.black),
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "assets/noResult.jpg",
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userNamesList[index],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                child: Text(
                                  "EMAIL",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                                  child: Text(
                                    "출석여부",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
