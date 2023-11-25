import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/items/show_alert_dialog_fill_out.dart';
import 'package:moggoji/items/show_chart_ox.dart';
import 'package:moggoji/pages/survey_page.dart';
import 'package:moggoji/service/globals.dart';
import 'package:http/http.dart' as http;
import '../../models/answer.dart';

enum Title { checked, chart }

class SubmitSurveyOx extends StatefulWidget {
  final String surveyTitle;
  final int surveyNumber;

  const SubmitSurveyOx({
    Key? key,
    required this.surveyTitle,
    required this.surveyNumber
  })
      : super(key: key);

  @override
  State<SubmitSurveyOx> createState() => _SubmitSurveyOxState();
}

class _SubmitSurveyOxState extends State<SubmitSurveyOx> {
  var setOBgColor = Colors.white70;
  var setXBgColor = Colors.white70;
  var isOBtnOn = false;
  var isXBtnOn = false;

  Title _selectedTitle = Title.checked;

  Answer answer = Answer(
      surveyNumber: 0,
      surveyType: 1,
      surveyTitle: '',
      surveyCreator: 'sonny',
      answer1: 0,
      answer2: 0,
      answer3: 0,
      answer4: 0,
      answer5: 0,
      answer6: 0,
      answer7: 0,
      answer8: 0,
      answer9: 0,
      answer10: 0,
      answer11: 0,
      answer12: 0,
      answer13: 0,
      answer14: 0,
      answer15: 0);

  Future save() async {
    var res = await http.post(Uri.parse(addAnswer),
        headers: headers,
        body: json.encode({
          'surveyNumber':answer.surveyNumber,
          'surveyType':answer.surveyType,
          'surveyTitle':answer.surveyTitle,
          'surveyCreator':answer.surveyCreator,
          'answer1':answer.answer1,
          'answer2':answer.answer2,
          'answer3':answer.answer3,
          'answer4':answer.answer4,
          'answer5':answer.answer5,
          'answer6':answer.answer6,
          'answer7':answer.answer7,
          'answer8':answer.answer8,
          'answer9':answer.answer9,
          'answer10':answer.answer10,
          'answer11':answer.answer11,
          'answer12':answer.answer12,
          'answer13':answer.answer13,
          'answer14':answer.answer14,
          'answer15':answer.answer15
        }));
    print(res.body);
  }

  List<Answer> answersList = [];

  @override
  void initState() {
    super.initState();
    fetchAnswers();
  }

  Future<void> fetchAnswers() async {
    String resultAnswerURL = '$getAllBySurveyNumber/${widget.surveyNumber}';
    final response = await http.get(Uri.parse(resultAnswerURL));
    print(widget.surveyNumber);
    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final List<dynamic> data = jsonDecode(responseBody);
      print(response.body);
      setState(() {
        answersList = data.map((json) => Answer.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load schedules');
    }
  }

  int answerOCount = 0;
  int answerXCount = 0;

  void countAnswer(int answer) {
    switch(answer) {
      case 6:
        answerOCount++;
        break;
      case 7:
        answerXCount++;
        break;
      default:
        break;
    }
  }

  void countAnswerByQuestion(int index) {
    for(int i = 0; i<answersList.length; i++) {
      countAnswer(answersList[i].answer1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 70.0),
              child: Text("OX 설문"),
            ),
            TextButton(
              onPressed: ()=>(
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("OX 설문 제출"),
                      content: Text("선택하신 결과를 제출하시겠습니까?"),
                      actions: <Widget>[
                        TextButton(onPressed: ()=>Navigator.pop(context, 'Cancel'),
                            child: Text("취소")
                        ),
                        TextButton(onPressed: (){
                          if(isOBtnOn == false && isXBtnOn == false) {
                            Navigator.of(context).pop();
                            showDialog(context: context, builder: (context){
                                  return ShowAlertDialogFillOut(
                                      title: "미선택!!",
                                      content: "O, X 둘 중 하나를 선택해주세요!"
                                  );
                                });
                              } else {
                            answer.surveyTitle = widget.surveyTitle;
                            answer.surveyNumber = widget.surveyNumber;
                            save();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SurveyPage()));
                          }
                        },
                            child: Text("제출")
                        )
                      ],
                    );
                  })
              ),
              child: Text("제출"),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.surveyTitle,
              style: TextStyle(fontSize: 20.0),) //db에서 가져오기
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.symmetric(horizontal: 5.0),
            child: SegmentedButton<Title>(
                selected: <Title>{_selectedTitle},
                onSelectionChanged: (Set<Title> newSelection){
                  setState(() {
                    _selectedTitle = newSelection.first;
                  });
                },
                segments: const <ButtonSegment<Title>>[
                  ButtonSegment<Title>(
                      value: Title.checked,
                      label: Text("OX 선택")
                  ),
                  ButtonSegment<Title>(
                      value: Title.chart,
                      label: Text("통계")
                  )
                ],
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),)
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  if(_selectedTitle.name == "checked") {
                    return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Center(
                              child: SizedBox(
                                width: 350,
                                height: 250,
                                child: ElevatedButton(
                                    onPressed: ()=>(setState((){
                                      if(setOBgColor == Colors.white70) {
                                        answer.answer1 = 6;
                                        setOBgColor = Colors.deepPurpleAccent.shade100;
                                        isOBtnOn = true;
                                        setXBgColor = Colors.white70;
                                      } else {
                                        answer.answer1 = 0;
                                        isOBtnOn = false;
                                        setOBgColor = Colors.white70;
                                      }
                                    })
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(setOBgColor),
                                        shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.circular(60)
                                        ))
                                    ),
                                    child: Text("O",
                                      style: TextStyle(fontSize: 50.0),
                                    )
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Center(
                              child: SizedBox(
                                width: 350,
                                height: 250,
                                child: ElevatedButton(
                                    onPressed: ()=>(setState((){
                                      if(setXBgColor == Colors.white70) {
                                        answer.answer1 = 7;
                                        setXBgColor = Colors.deepPurpleAccent.shade100;
                                        isXBtnOn = true;
                                        setOBgColor = Colors.white70;
                                      } else {
                                        answer.answer1 = 0;
                                        isXBtnOn = false;
                                        setXBgColor = Colors.white70;
                                      }
                                    })),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(setXBgColor),
                                        shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.circular(60)
                                        ))
                                    ),
                                    child: Text("X",
                                      style: TextStyle(fontSize: 50.0),
                                    )
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if(_selectedTitle.name == "chart"){
                    answerOCount = 0;
                    answerXCount = 0;

                    countAnswerByQuestion(index);

                    if(answerOCount == 0 && answerXCount == 0) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/noResult.jpg',
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("아직까지 참여한 사람이 없습니다",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return ShowChartOx(
                      answerOCount: answerOCount,
                      answerXCount: answerXCount,
                    );
                  }
                }),
          )
        ],
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
