import 'package:flutter/material.dart';
import 'package:moggoji/pages/main_screen.dart';

class RegistEventPage extends StatefulWidget {
  const RegistEventPage({super.key});

  @override
  State<RegistEventPage> createState() => _RegistEventPageState();
}

class _RegistEventPageState extends State<RegistEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 78.0),
              child: Text("행사 등록"),
            ),
            TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));},
                child: Text("등록",
                  style: TextStyle(
                    fontSize: 15
                  ),
                ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // decoration: BoxDecoration(
          //     color: Color(0xFFFFFFFF),
          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
          //     boxShadow: [
          //       BoxShadow(
          //           color: Colors.deepPurpleAccent.shade100,
          //           blurRadius: 10,
          //           offset: Offset(2.0,2.0)
          //       )
          //     ]
          // ),
          margin: EdgeInsetsDirectional.symmetric(horizontal: 20.0,vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "제목",
                          hintText: "ex) 개강총회",
                          hintStyle: TextStyle(color: Colors.grey),
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                          //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      /* 추후 날짜 선택으로 변경 */
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            labelText: "날짜",
                            hintText: "ex) 2023-09-08",
                            hintStyle: TextStyle(color: Colors.grey),
                          //   enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          //   ),
                          //   border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "장소",
                            hintText: "ex) 누리관",
                            hintStyle: TextStyle(color: Colors.grey),
                          //   enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          //   ),
                          //   border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "내용",
                            hintText: "ex) 개강총회 및 팀빌딩",
                            hintStyle: TextStyle(color: Colors.grey),
                          //   enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          //   ),
                          //   border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "금액",
                            hintText: "ex) 0 or 5000 or 열정",
                            hintStyle: TextStyle(color: Colors.grey),
                          //   enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          //   ),
                          //   border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //     alignment: Alignment.center,
              //     margin: EdgeInsetsDirectional.symmetric(vertical: 20.0),
              //     child: SizedBox(
              //       width: 200,
              //       height: 50,
              //       child: ElevatedButton(
              //           onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));},
              //           style: ButtonStyle(
              //               shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(10)
              //               )
              //               )
              //           ),
              //           child: Text("등록하기", style: TextStyle(
              //               fontSize: 18
              //               ),
              //           )
              //       ),
              //     )
              // )
            ],
          ),
        ),
      )
    );
  }
}