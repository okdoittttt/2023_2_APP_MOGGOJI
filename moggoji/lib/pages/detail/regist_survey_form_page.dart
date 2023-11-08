import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/pages/detail/submit_survey_form_page.dart';

class RegistSurveyFormPage extends StatefulWidget {
  const RegistSurveyFormPage({super.key});

  @override
  State<RegistSurveyFormPage> createState() => _RegistSurveyFormPageState();
}

class _RegistSurveyFormPageState extends State<RegistSurveyFormPage> {
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
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 50.0),
                child: Text("Form 설문 등록"),
              ),
              TextButton(
                onPressed: ()=>(
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        content: Text("작성하신 설문 항목들을 등록하시겠습니까?"),
                        actions: <Widget>[
                          TextButton(onPressed: ()=>Navigator.pop(context, 'Cancel'),
                              child: Text("취소")
                          ),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SurveyForm()));
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
        body: SingleChildScrollView(
          child: Container(
            child: Column(
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
                      onPressed: ()=>(),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNaviBar(),
      ),
    );
  }
}
