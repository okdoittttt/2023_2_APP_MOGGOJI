import 'package:flutter/material.dart';
import 'package:moggoji/pages/detail/regist_survey_form_page.dart';
import 'package:moggoji/pages/detail/regist_survey_ox_page.dart';

class ShowDialogRegistSurvey extends StatefulWidget {
  const ShowDialogRegistSurvey({super.key});

  @override
  State<ShowDialogRegistSurvey> createState() => _ShowDialogRegistSurveyState();
}

class _ShowDialogRegistSurveyState extends State<ShowDialogRegistSurvey> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 0,
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("등록할 설문조사 유형을 선택하세요",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RegistSurveyOxPage()));},
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                        )
                    ),
                    child: Text("OX 등록", style: TextStyle(letterSpacing: 1),)),
                ElevatedButton(
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RegistSurveyFormPage()));},
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                        )
                    ),
                    child: Text("설문 등록", style: TextStyle(letterSpacing: 1),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
