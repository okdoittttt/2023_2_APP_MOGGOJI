import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/items/show_alert_dialog_fill_out.dart';
import 'package:moggoji/pages/survey_page.dart';

enum Title { fillOut, chart }

class AddForm {
  final String question;

  AddForm({required this.question});
}

class SubmitSurveyForm extends StatefulWidget {
  const SubmitSurveyForm({super.key});

  @override
  State<SubmitSurveyForm> createState() => _SubmitSurveyFormState();
}

class _SubmitSurveyFormState extends State<SubmitSurveyForm> {
  Title _selectedTitle = Title.fillOut;

  String question = '';

  List<AddForm> addForm = [];

  @override
  Widget build(BuildContext context) {
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
                child: Text("설문제목",
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
                itemCount: 1,
                itemBuilder: (context, index){
                  return Text(_selectedTitle.name.toString());
                }),
          )
        ],
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
