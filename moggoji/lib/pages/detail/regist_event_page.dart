import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/models/schedule.dart';
import 'package:moggoji/pages/event_page.dart';
import 'package:moggoji/pages/main_screen.dart';
import 'package:moggoji/service/globals.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:http/http.dart' as http;

class RegistEventPage extends StatefulWidget {
  const RegistEventPage({super.key});

  @override
  State<RegistEventPage> createState() => _RegistEventPageState();
}

class _RegistEventPageState extends State<RegistEventPage> {
  final _registKey = GlobalKey<FormState>();
  var dateTimePicker = '';
  Schedule schedule = Schedule(
      number: 0,
      title: '',
      writer: 'sonny',
      location: '',
      date: '',
      content: '',
      fee: 0,
      participantName: 'sonny');

  Future save() async {
    var res = await http.post(Uri.parse(addTask),
        headers: headers,
        body: json.encode({
          'title': schedule.title,
          'writer': schedule.writer,
          'location': schedule.location,
          'date': schedule.date,
          'content': schedule.content,
          'fee': schedule.fee,
          "participantName": schedule.participantName
        }));

    print(res.body);
  }
  String eventCharge = "";
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
                      const EdgeInsetsDirectional.symmetric(horizontal: 78.0),
                  child: Text("행사 등록"),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text("행사 등록하기"),
                        content: Text("작성하신 내용을 등록하시겠습니까?"),
                        actions: <Widget>[
                          TextButton(onPressed: () =>
                              Navigator.pop(context, 'Cancel'),
                              child: Text("취소")
                          ),
                          TextButton(onPressed: () {
                            schedule.fee = int.tryParse(eventCharge)??0; // 문자열을 int로 변환한 후 실패하면 기본값을 0으로 설정
                            save();
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => EventPage()));
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
                  ),
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: 20.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _registKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: TextFormField(
                            controller:
                                TextEditingController(text: schedule.title),
                            onChanged: (val) {
                              schedule.title = val;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Title is Empty!";
                              }
                              return "";
                            },
                            decoration: InputDecoration(
                              labelText: "제목",
                              hintText: "ex) 개강총회",
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
                                    schedule.date = date.toIso8601String();
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
                                TextEditingController(text: schedule.location),
                            onChanged: (val) {
                              schedule.location = val;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "location is Empty!";
                              }
                              return "";
                            },
                            decoration: InputDecoration(
                              labelText: "장소",
                              hintText: "ex) 누리관",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: TextFormField(
                            controller:
                                TextEditingController(text: schedule.content),
                            onChanged: (val) {
                              schedule.content = val;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Content is Empty!";
                              }
                              return "";
                            },
                            decoration: InputDecoration(
                              labelText: "내용",
                              hintText: "ex) 개강총회 및 팀빌딩",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: TextFormField(
                            controller: TextEditingController(
                                text: eventCharge),
                            onChanged: (val) {
                              eventCharge = val;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "fee is Empty!";
                              }
                              return "";
                            },
                            decoration: InputDecoration(
                              labelText: "금액",
                              hintText: "ex) 0 or 5000",
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
          ),
        bottomNavigationBar: BottomNaviBar(),
      ),
    );
  }
}
