import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moggoji/items/notice_listView.dart';
import 'package:moggoji/pages/notice_page.dart';

class DetailNoticePage extends StatefulWidget {
  final String title;
  final String category;
  final String content;
  final String date;
  final String writer;

  const DetailNoticePage({
    Key? key,
    required this.title,
    required this.category,
    required this.content,
    required this.date,
    required this.writer,
  }) : super(key: key);

  @override
  State<DetailNoticePage> createState() => _DetailNoticePageState();
}

class _DetailNoticePageState extends State<DetailNoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      child: Image.network(
                        'https://avatars.githubusercontent.com/u/39268032?s=200&v=4',
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 16, 0, 0),
                        child: Text("${widget.title}",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        height: 400,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,  // 선의 색상
                            width: 2.0,           // 선의 두께
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white60,  // 그림자의 색상
                              spreadRadius: 2.0,   // 그림자의 확산 범위
                              blurRadius: 10.0,    // 그림자의 흐림 정도
                              offset: Offset(0, 5),  // 그림자의 위치 조절 (x, y)
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),  // 태두리의 모서리를 둥글게 만듭니다.
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,  // 수직 방향으로 최소한의 공간을 차지하도록 설정
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 4),
                              child: Text(
                                "DESCRIPTION",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 4),
                              child: Text(
                                widget.content,
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Divider(
                    //   height: 24,
                    //   thickness: 2,
                    //   indent: 20,
                    //   endIndent: 20,
                    //   color: Colors.black,
                    // ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 244, 244, 244),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.black,
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '날짜',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                      '${DateFormat("yyyy/MM/dd HH:MM").format(DateTime.parse(widget.date))}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 24,
                                thickness: 2,
                                color: Colors.white60
                              ),
                              Text(
                                widget.writer,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Row(
                                  children: [
                                    if(widget.category == "주요공지")
                                      Icon(Icons.receipt_long),
                                    if(widget.category == "인원모집")
                                      Icon(Icons.group),
                                    if(widget.category == "정보공유")
                                      Icon(Icons.lightbulb),
                                    SizedBox(width: 7.5),

                                    Text(
                                    widget.category,
                                  ),
                                  ]
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 12),
                          child: ElevatedButton(
                            onPressed: () {
                              // String documentName = "주요공지";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NoticePage()));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)
                              ),
                              primary: Colors.black
                            ),
                            child: Text("목록으로", style: TextStyle(color: Colors.white),),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
