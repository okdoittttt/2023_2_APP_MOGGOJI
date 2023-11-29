import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moggoji/items/schedule_detail_listView.dart';

class ScheduleDetailPage extends StatefulWidget {
  // 페이지로 전달 받을 데이터
  final String userNames;
  final String scheduleTitle;

  const ScheduleDetailPage(
      {Key? key, required this.userNames, required this.scheduleTitle})
      : super(key: key);

  @override
  State<ScheduleDetailPage> createState() => _ScheduleDetailPageState();
}

class _ScheduleDetailPageState extends State<ScheduleDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.scheduleTitle),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Text(
                "행사 참여자 리스트",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Color.fromARGB(50, 153, 204, 255)),
                    child: Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 7, 0, 7),
                        child: Text(
                          "Name",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Color.fromARGB(50, 153, 204, 255)),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 7, 0, 7),
                            child: Text(
                              "Status",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ScheduleDetailListView(userNames: widget.userNames);
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}
