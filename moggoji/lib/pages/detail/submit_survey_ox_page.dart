import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';
import 'package:moggoji/pages/main_screen.dart';

class SurveyOx extends StatefulWidget {
  const SurveyOx({super.key});

  @override
  State<SurveyOx> createState() => _SurveyOxState();
}

class _SurveyOxState extends State<SurveyOx> {
  var setOBgColor = Colors.white70;
  var setXBgColor = Colors.white70;
  var isOBtnOn = false;
  var isXBtnOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 70.0),
              child: Text("OX 설문"),
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
                          if(isOBtnOn == false && isXBtnOn == false) {
                            Navigator.of(context).pop();
                            showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    icon: Icon(Icons.warning_rounded, size: 50,color: Colors.red),
                                    title: Text("결과 미입력!!"),
                                    content: Text("결과를 선택해주세요!"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: Text("돌아가기"))
                                    ],
                                  );
                                });
                              } else {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("설문제목",
              style: TextStyle(fontSize: 20.0),) //db에서 가져오기
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Center(
              child: SizedBox(
                width: 350,
                height: 250,
                child: ElevatedButton(
                    onPressed: ()=>(setState((){
                      if(setOBgColor == Colors.white70) {
                        setOBgColor = Colors.deepPurpleAccent.shade100;
                        isOBtnOn = true;
                        setXBgColor = Colors.white70;
                      } else {
                        isOBtnOn = false;
                        setOBgColor = Colors.white70;
                      }
                      })
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(setOBgColor),
                        shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(60)
                        ))
                    ),
                    child: Text("O",
                      style: TextStyle(fontSize: 50.0),
                    )
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Center(
              child: SizedBox(
                width: 350,
                height: 250,
                child: ElevatedButton(
                    onPressed: ()=>(setState((){
                      if(setXBgColor == Colors.white70) {
                        setXBgColor = Colors.deepPurpleAccent.shade100;
                        isXBtnOn = true;
                        setOBgColor = Colors.white70;
                      } else {
                        isXBtnOn = false;
                        setXBgColor = Colors.white70;
                      }
                    })),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(setXBgColor),
                        shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(60)
                        ))
                    ),
                    child: Text("X",
                      style: TextStyle(fontSize: 50.0),
                    )
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
