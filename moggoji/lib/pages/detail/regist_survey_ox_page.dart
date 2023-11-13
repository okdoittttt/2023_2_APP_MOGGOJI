import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/items/show_alert_dialog_fill_out.dart';

import 'package:moggoji/pages/detail/submit_survey_ox_page.dart';
import '../../models/survey.dart';
import '../../service/globals.dart';

class RegistSurveyOxPage extends StatefulWidget {
  const RegistSurveyOxPage({super.key});

  @override
  State<RegistSurveyOxPage> createState() => _RegistSurveyOxPageState();
}

class _RegistSurveyOxPageState extends State<RegistSurveyOxPage> {
  final _registNoteKey = GlobalKey<FormState>();

  Survey survey = Survey(
      survey_number: 0,
      survey_title: '',
      survey_type: 0,
      survey_creator: 'sonny',
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
          'survey_number': survey.survey_number,
          'survey_title': survey.survey_title,
          'survey_type': survey.survey_type,
          'survey_creator': survey.survey_creator,
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
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 60.0),
                child: Text("OX 설문 등록"),
              ),
              TextButton(
                onPressed: ()=>(
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text("설문 등록"),
                        content: Text("작성하신 설문 제목을 등록하시겠습니까?"),
                        actions: <Widget>[
                          TextButton(
                              onPressed: ()=>Navigator.pop(context, 'Cancel'),
                              child: Text("취소")
                          ),
                          TextButton(
                              onPressed: (){
                                if(survey.survey_title == '') {
                                  Navigator.pop(context);
                                  showDialog(context: context, builder: (context){
                                    return ShowAlertDialogFillOut(
                                        title:"미입력!!",
                                        content: "제목을 입력해주세요!"
                                    );
                                  });
                                } else {
                                  save();
                                  Navigator.push(context,
                                      // MaterialPageRoute(builder: (context)=>SurveyPage()))
                                      MaterialPageRoute(builder: (context)=>SubmitSurveyOx()));
                                }
                          },
                              child: Text("등록")
                          )
                        ],
                      );
                    })
                ),
                child: Text("등록"),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Form(
            key: _registNoteKey,
            child: TextFormField(
              controller: TextEditingController(text: survey.survey_title),
              onChanged: (value) {
                setState(() {
                  survey.survey_title = value;
                  survey.survey_type = 2;
                });
              },
              decoration: InputDecoration(
                labelText: "설문제목",
                hintText: "ex) 만족도"
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNaviBar(),
      ),
    );
  }
}
