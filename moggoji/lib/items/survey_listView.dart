import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moggoji/pages/detail/submit_survey_form_page.dart';
import 'package:moggoji/pages/detail/submit_survey_ox_page.dart';
import '../models/survey.dart';
import '../service/globals.dart';

class SurveyListView extends StatefulWidget {
  const SurveyListView({Key? key})
      : super(key: key);

  @override
  State<SurveyListView> createState() => _SurveyListViewState();
}

class _SurveyListViewState extends State<SurveyListView> {
  List<Survey> surveys = [];

  @override
  void initState() {
    super.initState();
    fetchSurveys();
  }

  Future<void> fetchSurveys() async {
    String getAllResultSurvey = '$SurveybaseURL/getAllSurvey';

    final response = await http.get(Uri.parse(getAllResultSurvey));

    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final List<dynamic> data = jsonDecode(responseBody);

      print(response.body);
      setState(() {
        surveys = data.map((json) => Survey.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load surveys');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        child: ListView.builder(
          physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          shrinkWrap: true,
          itemCount: surveys.length,
          itemBuilder: (BuildContext context, int index) {
            final survey = surveys[index];
            final String surveyImg = "assets/surveyImg${index+1}.jpg";

            return GestureDetector(
              onTap: () {
                if(survey.surveyType == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SubmitSurveyOx(
                        surveyTitle: survey.surveyTitle,
                        surveyNumber: survey.surveyNumber,
                      ))
                  );
                } else if(survey.surveyType == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SubmitSurveyForm(
                        surveyNumber: survey.surveyNumber,
                        surveyTitle: survey.surveyTitle,
                        content1: survey.content1,
                        content2: survey.content2,
                        content3: survey.content3,
                        content4: survey.content4,
                        content5: survey.content5,
                        content6: survey.content6,
                        content7: survey.content7,
                        content8: survey.content8,
                        content9: survey.content9,
                        content10: survey.content10,
                        content11: survey.content11,
                        content12: survey.content12,
                        content13: survey.content13,
                        content14: survey.content14,
                        content15: survey.content15,
                      ))
                  );
                }
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        color: Colors.blueAccent.shade100,
                        offset: Offset(3, 5),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/surveyImg1.jpg',
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                survey.surveyTitle,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 30),
                              Text(survey.surveyCreator)
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                survey.surveyType == 1? "OX 설문조사" : "만족도 설문조사" ,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}