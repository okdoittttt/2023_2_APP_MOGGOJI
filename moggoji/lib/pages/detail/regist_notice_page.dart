import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moggoji/pages/notice_page.dart';

import 'package:moggoji/service/globals.dart';

import '../../models/notice.dart';

class RegistNoticePage extends StatefulWidget {
  const RegistNoticePage({super.key});

  @override
  State<RegistNoticePage> createState() => _RegistNoticePageState();
}

class _RegistNoticePageState extends State<RegistNoticePage> {
  final _registNoteKey = GlobalKey<FormState>();
  List<bool> _selections1 = List.generate(3, (index) => false);

  Notice notice = Notice(
      number: 0,
      title: '',
      content: '',
      writer: 'sonny',
      date: '',
      category: '');

  Future save() async {
    var res = await http.post(Uri.parse(addNotice),
        headers: headers,
        body: json.encode({
          'title': notice.title,
          'content': notice.content,
          'writer': notice.writer,
          'date': notice.date.substring(0,10) + 'T' + notice.date.substring(11,16) + ":00.000+00:00",
          'category': notice.category,
        }));

    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                      EdgeInsetsDirectional.symmetric(horizontal: 78.0),
                      child: Text("공지 등록"),
                    ),
                    TextButton(
                        onPressed: () {
                          save();

                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("공지 등록이 완료 되었습니다.",
                                  style: TextStyle(
                                      fontSize: 23
                                  ),),
                                content: Text("메인 페이지로 이동합니다."),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => NoticePage()));
                                      },
                                      child: Text("확인"))
                                ],
                              ));
                        },
                        child: Text(
                          "등록",
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                )),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsetsDirectional.symmetric(
                    horizontal: 20.0, vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ToggleButtons(children: <Widget>[
                      Icon(Icons.ac_unit),
                      Icon(Icons.ac_unit),
                      Icon(Icons.ac_unit),
                    ],onPressed: (int index) {
                      setState(() {
                        _selections1[index] = !_selections1[index];
                      });
                    }, isSelected: _selections1),
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Container(
                                  width: 120,
                                  constraints: BoxConstraints(
                                    maxWidth: 500,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.purple,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 16, 8, 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.receipt_long,
                                          color: Colors.purple,
                                          size: 36,
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: Text(
                                            '주요공지',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                          ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Container(
                                  width: 120,
                                  constraints: BoxConstraints(
                                    maxWidth: 500,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.purple,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 16, 8, 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.group,
                                          color: Colors.purple,
                                          size: 36,
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: Text(
                                            '인원모집',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                          ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Container(
                                  width: 120,
                                  constraints: BoxConstraints(
                                    maxWidth: 500,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.purple,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 16, 8, 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.lightbulb,
                                          color: Colors.purple,
                                          size: 36,
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: Text(
                                            '정보공유',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ]
                    ),
                    Form(
                      key: _registNoteKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: TextFormField(
                              controller:
                              TextEditingController(text: notice.title),
                              onChanged: (val) {
                                notice.title = val;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Title is Empty!";
                                }
                                return "";
                              },
                              decoration: InputDecoration(
                                labelText: "제목",
                                hintText: "ex) 플러터 프로젝트 인원 모집",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            /* 추후 날짜 선택으로 변경 */
                            child: TextFormField(
                              controller:
                              TextEditingController(text: notice.date),
                              onChanged: (val) {
                                notice.date = val;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Date is Empty!";
                                }
                                return "";
                              },
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                labelText: "날짜",
                                hintText: "ex) 2023-09-08 17:00",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: TextFormField(
                              controller:
                              TextEditingController(text: notice.content),
                              onChanged: (val) {
                                notice.content = val;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "content is Empty!";
                                }
                                return "";
                              },
                              decoration: InputDecoration(
                                labelText: "내용",
                                hintText: "플러터 및 스프링 부트 프로젝트 스터디 및 프로젝트 진행",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: TextFormField(
                              controller:
                              TextEditingController(text: notice.category),
                              onChanged: (val) {
                                notice.category = val;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "category is Empty!";
                                }
                                return "";
                              },
                              decoration: InputDecoration(
                                labelText: "카테고리",
                                hintText: "추후 카테고리 선택으로 디자인 변경",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
