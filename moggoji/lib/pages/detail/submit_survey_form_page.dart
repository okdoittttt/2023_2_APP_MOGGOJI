import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/items/show_alert_dialog_fill_out.dart';
import 'package:moggoji/pages/survey_page.dart';
import 'package:moggoji/service/globals.dart';
import 'package:http/http.dart' as http;
import '../../models/answer.dart';

enum Title { fillOut, chart }

class SubmitSurveyForm extends StatefulWidget {
  final String surveyTitle;
  final int surveyNumber;
  final String content1;
  final String content2;
  final String content3;
  final String content4;
  final String content5;
  final String content6;
  final String content7;
  final String content8;
  final String content9;
  final String content10;
  final String content11;
  final String content12;
  final String content13;
  final String content14;
  final String content15;

  const SubmitSurveyForm({Key? key,
    required this.surveyTitle,
    required this.surveyNumber,
    required this.content1,
    required this.content2,
    required this.content3,
    required this.content4,
    required this.content5,
    required this.content6,
    required this.content7,
    required this.content8,
    required this.content9,
    required this.content10,
    required this.content11,
    required this.content12,
    required this.content13,
    required this.content14,
    required this.content15,
  })
      :super(key: key);

  @override
  State<SubmitSurveyForm> createState() => _SubmitSurveyFormState();
}

class _SubmitSurveyFormState extends State<SubmitSurveyForm> {
  Title _selectedTitle = Title.fillOut;

  double _sliderValue1 = 2;
  double _sliderValue2 = 2;
  double _sliderValue3 = 2;
  double _sliderValue4 = 2;
  double _sliderValue5 = 2;
  double _sliderValue6 = 2;
  double _sliderValue7 = 2;
  double _sliderValue8 = 2;
  double _sliderValue9 = 2;
  double _sliderValue10 = 2;
  double _sliderValue11 = 2;
  double _sliderValue12 = 2;
  double _sliderValue13 = 2;
  double _sliderValue14 = 2;
  double _sliderValue15 = 2;

  Answer answer = Answer(
    surveyNumber: 0,
    surveyType: 2,
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

  void sliderSwitchCase(int index, List<double> sliders) {
    switch(index) {
      case 0:
        _sliderValue1 = sliders[index];
        break;
      case 1:
        _sliderValue2 = sliders[index];
        break;
      case 2:
        _sliderValue3 = sliders[index];
        break;
      case 3:
        _sliderValue4 = sliders[index];
        break;
      case 4:
        _sliderValue5 = sliders[index];
        break;
      case 5:
        _sliderValue6 = sliders[index];
        break;
      case 6:
        _sliderValue7 = sliders[index];
        break;
      case 7:
        _sliderValue8 = sliders[index];
        break;
      case 8:
        _sliderValue9 = sliders[index];
        break;
      case 9:
        _sliderValue10 = sliders[index];
        break;
      case 10:
        _sliderValue11 = sliders[index];
        break;
      case 11:
        _sliderValue12 = sliders[index];
        break;
      case 12:
        _sliderValue13 = sliders[index];
        break;
      case 13:
        _sliderValue14 = sliders[index];
        break;
      case 14:
        _sliderValue15 = sliders[index];
        break;
    }
  }

  void answerSwitchCase(int index, List<int> answers) {
    switch(index) {
      case 0:
        answer.answer1 = answers[index];
        break;
      case 1:
        answer.answer2 = answers[index];
        break;
      case 2:
        answer.answer3 = answers[index];
        break;
      case 3:
        answer.answer4 = answers[index];
        break;
      case 4:
        answer.answer5 = answers[index];
        break;
      case 5:
        answer.answer6 = answers[index];
        break;
      case 6:
        answer.answer7 = answers[index];
        break;
      case 7:
        answer.answer8 = answers[index];
        break;
      case 8:
        answer.answer9 = answers[index];
        break;
      case 9:
        answer.answer10 = answers[index];
        break;
      case 10:
        answer.answer11 = answers[index];
        break;
      case 11:
        answer.answer12 = answers[index];
        break;
      case 12:
        answer.answer13 = answers[index];
        break;
      case 13:
        answer.answer14 = answers[index];
        break;
      case 14:
        answer.answer15 = answers[index];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    List<String> contents = [
      widget.content1,
      widget.content2,
      widget.content3,
      widget.content4,
      widget.content5,
      widget.content6,
      widget.content7,
      widget.content8,
      widget.content9,
      widget.content10,
      widget.content11,
      widget.content12,
      widget.content13,
      widget.content14,
      widget.content15
    ];

    List<int> answers = [
      answer.answer1,
      answer.answer2,
      answer.answer3,
      answer.answer4,
      answer.answer5,
      answer.answer6,
      answer.answer7,
      answer.answer8,
      answer.answer9,
      answer.answer10,
      answer.answer11,
      answer.answer12,
      answer.answer13,
      answer.answer14,
      answer.answer15
    ];

    List<double> sliders = [
      _sliderValue1,
      _sliderValue2,
      _sliderValue3,
      _sliderValue4,
      _sliderValue5,
      _sliderValue6,
      _sliderValue7,
      _sliderValue8,
      _sliderValue9,
      _sliderValue10,
      _sliderValue11,
      _sliderValue12,
      _sliderValue13,
      _sliderValue14,
      _sliderValue15
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 70.0),
              child: Text("Form 설문"),
            ),
            TextButton(
              onPressed: ()=>(
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("설문 제출"),
                      content: Text("선택하신 결과를 제출하시겠습니까?"),
                      actions: <Widget>[
                        TextButton(onPressed: ()=>Navigator.pop(context, 'Cancel'),
                            child: Text("취소")
                        ),
                        TextButton(onPressed: (){
                          if(_selectedTitle.name == "chart") {
                            Navigator.of(context).pop();
                            showDialog(context: context, builder: (context){
                              return ShowAlertDialogFillOut(
                                  title: "미입력!!",
                                  content: "모든 항목을 입력해주세요!!"
                              );
                            });
                          } else {
                            answer.surveyNumber = widget.surveyNumber;
                            answer.surveyTitle = widget.surveyTitle;
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
          Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.surveyTitle,
                  style: TextStyle(fontSize: 20.0),) //db에서 가져오기
            ),
          ),
          Container(
          width: double.infinity,
            margin: EdgeInsetsDirectional.symmetric(horizontal: 5.0),
            child: SegmentedButton<Title>(
                selected: <Title>{_selectedTitle},
                onSelectionChanged: (Set<Title> newSelection){
                  setState(() {
                    _selectedTitle = newSelection.first;
                    print(_selectedTitle.name);
                  });
                },
                segments: const <ButtonSegment<Title>>[
                  ButtonSegment<Title>(
                      value: Title.fillOut,
                      label: Text("설문 작성")
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
                itemCount: contents.length,
                itemBuilder: (context, index) {
                  if(_selectedTitle.name == "fillOut" && contents[index] != '') {
                    return Container(
                      margin: EdgeInsetsDirectional.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Text(contents[index]),
                          ListTile(
                            leading: Text("매우 그렇지 않다"),
                            trailing: Text("매우 그렇다"),
                          ),
                          Slider(
                              min: 0,
                              max: 4,
                              divisions: 4,
                              label: (sliders[index].floor() + 1).toString(),
                              value: sliders[index],
                              onChanged: (double value){
                                setState(() {
                                  sliders[index] = value;
                                  answers[index] = sliders[index].toInt() + 1;
                                  sliderSwitchCase(index, sliders);
                                  answerSwitchCase(index, answers);
                                });
                              }
                          ),
                        ],
                      ),
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
