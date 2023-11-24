import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/items/show_alert_dialog_fill_out.dart';
import 'package:moggoji/pages/survey_page.dart';
import '../../models/survey.dart';
import '../../service/globals.dart';

class AddForm {
  final String question;

  AddForm({required this.question});
}

void switchCase(Survey survey, int surveyIndex, List addForm, int index) {
  switch(surveyIndex) {
    case 0: survey.content1 = addForm[index].question;
    break;
    case 1: survey.content2 = addForm[index].question;
    break;
    case 2: survey.content3 = addForm[index].question;
    break;
    case 3: survey.content4 = addForm[index].question;
    break;
    case 4: survey.content5 = addForm[index].question;
    break;
    case 5: survey.content6 = addForm[index].question;
    break;
    case 6: survey.content7 = addForm[index].question;
    break;
    case 7: survey.content8 = addForm[index].question;
    break;
    case 8: survey.content9 = addForm[index].question;
    break;
    case 9: survey.content10 = addForm[index].question;
    break;
    case 10: survey.content11 = addForm[index].question;
    break;
    case 11: survey.content12 = addForm[index].question;
    break;
    case 12: survey.content13 = addForm[index].question;
    break;
    case 13: survey.content14 = addForm[index].question;
    break;
    case 14: survey.content15 = addForm[index].question;
    break;
  }
}

class RegistSurveyFormPage extends StatefulWidget {
  const RegistSurveyFormPage({super.key});

  @override
  State<RegistSurveyFormPage> createState() => _RegistSurveyFormPageState();
}

class _RegistSurveyFormPageState extends State<RegistSurveyFormPage> {
  String question = '';
  int indexOfQuestion = 0;

  List<AddForm> addForm = [];

  final _registNoteKey = GlobalKey<FormState>();

  Survey survey = Survey(
      surveyNumber: 0,
      surveyTitle: '',
      surveyType: 0,
      surveyCreator: 'sonny',
      content1: '',
      content2: '',
      content3: '',
      content4: '',
      content5: '',
      content6: '',
      content7: '',
      content8: '',
      content9: '',
      content10: '',
      content11: '',
      content12: '',
      content13: '',
      content14: '',
      content15: '');

  Future save() async {
    var res = await http.post(Uri.parse(addSurvey),
        headers: headers,
        body: json.encode({
          'surveyNumber': survey.surveyNumber,
          'surveyTitle': survey.surveyTitle,
          'surveyType': survey.surveyType,
          'surveyCreator': survey.surveyCreator,
          'content1': survey.content1,
          'content2': survey.content2,
          'content3': survey.content3,
          'content4': survey.content4,
          'content5': survey.content5,
          'content6': survey.content6,
          'content7': survey.content7,
          'content8': survey.content8,
          'content9': survey.content9,
          'content10': survey.content10,
          'content11': survey.content11,
          'content12': survey.content12,
          'content13': survey.content13,
          'content14': survey.content14,
          'content15': survey.content15,
        }));

    print(res.body);
  }

  @override
  Widget build(BuildContext context) {

    void saveContents(Survey survey, List addForm) {
      int index = 0;
      for(int i=0; i<addForm.length; i++) {
        if(addForm[i].question != '') {
          switchCase(survey, index++, addForm, i);
        }
      }
    }

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 50.0),
                child: Text("Form 설문 등록"),
              ),
              TextButton(
                onPressed: (){
                    showDialog(context: context,
                        builder: (_){
                      return AlertDialog(
                        title: Text("설문 등록"),
                        content: Text("작성하신 설문 항목들을 등록하시겠습니까?"),
                        actions: <Widget>[
                          TextButton(onPressed: ()=>Navigator.pop(context, 'Cancel'),
                              child: Text("취소")
                          ),
                          TextButton(
                              onPressed: (){
                                if(survey.surveyTitle == '') {
                                  Navigator.pop(context);
                                  showDialog(context: context, builder: (context){
                                    return ShowAlertDialogFillOut(title:"미입력!!", content: "제목 또는 질문을 입력해주세요!");
                                });
                                } else {
                                  survey.surveyType = 2;
                                  saveContents(survey, addForm);
                                  save();
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>SurveyPage()));
                              }
                          },
                              child: Text("등록")
                          )
                        ],
                      );
                      });
                    },
                child: Text("등록"),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                          )
                      ),
                      child: Text("질문 추가"),
                      onPressed: (){
                        question = '';
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                                title: Text("질문 추가"),
                                actions: <Widget>[
                                  TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        question = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: "ex) 만족도는 어떠신가요?"
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: Text("취소")
                                      ),
                                      TextButton(
                                          child: Text("추가"),
                                          onPressed: () {
                                            if (question == '') {
                                              showDialog(context: context,
                                                  builder: (context) {
                                                    return ShowAlertDialogFillOut(
                                                      title: "미입력!!",
                                                      content: "질문을 입력해주세요!",);
                                                  });
                                            } else if(indexOfQuestion >= 15) {
                                              Navigator.pop(context);
                                              showDialog(context: context,
                                                  builder: (context) {
                                                    return ShowAlertDialogFillOut(
                                                        title: "질문 수 초과!!",
                                                        content: "질문 수가 15개입니다! 더이상 추가할 수 없습니다!");
                                                  });
                                            } else {
                                              setState(() {
                                                addForm.add(AddForm(
                                                    question: question));
                                                indexOfQuestion++;
                                                print(indexOfQuestion);
                                              });
                                              Navigator.pop(context);
                                            }
                                          }
                                      )
                                    ],
                                  )
                                ],
                              );
                            }
                        );
                      },
                  ),
                ),
                Form(
                  key: _registNoteKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: TextFormField(
                            controller: TextEditingController(text: survey.surveyTitle),
                            onChanged: (value){
                              survey.surveyTitle = value;
                            },
                            decoration: InputDecoration(
                              labelText: "제목",
                              hintText: "ex) 필요한 스터디 수요조사",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (_,index) {
                              return InkWell(
                                child: ListTile(
                                  title: Text(addForm[index].question),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton.outlined(
                                        onPressed: (){
                                          showDialog(context: context, builder: (context){
                                            return AlertDialog(
                                              title: Text("질문 수정"),
                                              actions: <Widget>[
                                                TextFormField(
                                                  initialValue: addForm[index].question,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      question = value;
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                      hintText: "ex) 학번을 입력하세요"
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                        onPressed: ()=>Navigator.pop(context, 'Cancel'),
                                                        child: Text("취소")
                                                    ),
                                                    TextButton(
                                                        child: Text("수정"),
                                                        onPressed: (){
                                                          if(question == '') {
                                                            showDialog(context: context, builder: (context){
                                                              return ShowAlertDialogFillOut(title:"미입력!!", content: "질문을 입력해주세요!",);
                                                            });
                                                          } else {
                                                            setState(() {
                                                              addForm[index] = AddForm(question: question);
                                                            });
                                                            Navigator.pop(context);
                                                          }
                                                        }
                                                    )
                                                  ],
                                                )
                                              ],
                                            );
                                          });
                                        },
                                        icon: Icon(Icons.edit),
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(OutlinedBorder.lerp(LinearBorder.none, LinearBorder.none, 0))),
                                      ),
                                      IconButton.outlined(
                                          onPressed: (){
                                            setState(() {
                                              addForm.removeAt(index);
                                              indexOfQuestion--;
                                            });
                                          },
                                          icon: Icon(Icons.delete_forever_rounded),
                                          style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(OutlinedBorder.lerp(LinearBorder.none, LinearBorder.none, 0))),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: addForm.length,
                          ),
                        )
                      ],
                    )
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
