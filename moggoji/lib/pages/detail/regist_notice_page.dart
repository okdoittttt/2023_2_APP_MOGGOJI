import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/pages/notice_page.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:moggoji/service/globals.dart';

import '../../models/notice.dart';

class RegistNoticePage extends StatefulWidget {
  const RegistNoticePage({super.key});

  @override
  State<RegistNoticePage> createState() => _RegistNoticePageState();
}

class _RegistNoticePageState extends State<RegistNoticePage> {
  final _registNoteKey = GlobalKey<FormState>();
  var dateTimePicker = '';
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
          'date': notice.date,
          'category': notice.category,
        }));

    print(res.body);
  }

  String selectedOption = "주요공지";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
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
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text("공지 등록하기"),
                          content: Text("작성하신 내용을 등록하시겠습니까?"),
                          actions: <Widget>[
                            TextButton(onPressed: () =>
                                Navigator.pop(context, 'Cancel'),
                                child: Text("취소")
                            ),
                            TextButton(onPressed: () {
                              save();
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => NoticePage()));
                            },
                                child: Text("등록")
                            )
                          ],
                        );
                      });
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
                          TextEditingController(text: dateTimePicker),
                          onTap: (){
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                onConfirm: (date) {setState(() {
                                  dateTimePicker = date.toString().substring(0,16);
                                  notice.date = date.toIso8601String();
                                  print('confirm $date');
                                });
                                },
                                currentTime: DateTime.now(), locale: LocaleType.ko);
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
                      Row(
                        children: <Widget>[
                          Radio(value: '주요공지',
                              groupValue: selectedOption,
                              onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                              notice.category = value;
                              print(selectedOption);
                            });
                              }),
                          Text('주요공지'),
                          Radio(value: '인원모집',
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value!;
                                  notice.category = value;
                                  print(selectedOption);
                                });
                              }),
                          Text('인원모집'),
                          Radio(value: '정보공유',
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value!;
                                  notice.category = value;
                                  print(selectedOption);
                                });
                              }),
                          Text('정보공유')
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNaviBar(),
      ),
    );
  }
}