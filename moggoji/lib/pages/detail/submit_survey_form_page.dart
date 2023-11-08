import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';

class SurveyForm extends StatefulWidget {
  const SurveyForm({super.key});

  @override
  State<SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
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
                      content: Text("선택하신 결과를 제출하시겠습니까?"),
                      actions: <Widget>[
                        TextButton(onPressed: ()=>Navigator.pop(context, 'Cancel'),
                            child: Text("취소")
                        ),
                        TextButton(onPressed: (){
                          // if(isOBtnOn == false && isXBtnOn == false) {
                          //   Navigator.of(context).pop();
                          //   showDialog(context: context, builder: (context){
                          //     return AlertDialog(
                          //       icon: Icon(Icons.warning_rounded, size: 50,color: Colors.red),
                          //       title: Text("결과 미입력!!"),
                          //       content: Text("결과를 선택해주세요!"),
                          //       actions: [
                          //         TextButton(
                          //             onPressed: () =>
                          //                 Navigator.pop(context, 'Cancel'),
                          //             child: Text("돌아가기"))
                          //       ],
                          //     );
                          //   });
                          // } else {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                          // }
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
        ],
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
