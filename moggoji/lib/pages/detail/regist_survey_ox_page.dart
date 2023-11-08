import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/pages/detail/submit_survey_ox_page.dart';

class RegistSurveyOxPage extends StatefulWidget {
  const RegistSurveyOxPage({super.key});

  @override
  State<RegistSurveyOxPage> createState() => _RegistSurveyOxPageState();
}

class _RegistSurveyOxPageState extends State<RegistSurveyOxPage> {
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
                        content: Text("작성하신 제목을 등록하시겠습니까?"),
                        actions: <Widget>[
                          TextButton(
                              onPressed: ()=>Navigator.pop(context, 'Cancel'),
                              child: Text("취소")
                          ),
                          TextButton(
                              onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SurveyOx()));
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
            child: TextFormField(
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
