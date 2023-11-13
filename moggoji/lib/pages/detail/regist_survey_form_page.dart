import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/items/show_alert_dialog_fill_out.dart';
import 'package:moggoji/pages/detail/submit_survey_form_page.dart';
import 'package:moggoji/pages/survey_page.dart';

enum Type { bar, objective, shortAnswer }

class AddForm {
  final String question;

  AddForm({required this.question});
}

class RegistSurveyFormPage extends StatefulWidget {
  const RegistSurveyFormPage({super.key});

  @override
  State<RegistSurveyFormPage> createState() => _RegistSurveyFormPageState();
}

class _RegistSurveyFormPageState extends State<RegistSurveyFormPage> {
  String question = '';
  String title = '';

  Type _selectedType = Type.objective;

  List<AddForm> addForm = [];

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
                                if(addForm.isEmpty || title == '') {
                                  Navigator.pop(context);
                                  showDialog(context: context, builder: (context){
                                    return ShowAlertDialogFillOut(title:"미입력!!", content: "제목 또는 질문을 입력해주세요!");
                                });
                                } else {
                                  Navigator.push(context,
                                      // MaterialPageRoute(builder: (context)=>SurveyPage()));
                                      MaterialPageRoute(builder: (context)=>SubmitSurveyForm()));
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
                                            } else {
                                              setState(() {
                                                addForm.add(AddForm(
                                                    question: question));
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: TextFormField(
                            controller: TextEditingController(text: title),
                            onChanged: (value){
                              title = value;
                            },
                            decoration: InputDecoration(
                              labelText: "제목",
                              hintText: "ex) 필요한 스터디 수요조사",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
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
