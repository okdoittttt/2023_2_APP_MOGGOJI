import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moggoji/main.dart';
import 'package:moggoji/models/user.dart';
import 'package:http/http.dart' as http;

import 'package:moggoji/service/globals.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  User user = User.fromMap({
    'number': 0, // number, id, pwd, email 값을 적절하게 설정.
    'id': '',
    'pwd': '',
    'email': '',
    'name': '',
    'gender': 'Male',
    'age': 0
  });

  var ageList = List<int>.generate(100, (index) => index + 1);
  int _selectedAge = 21;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: (){Navigator.pop(context);},
                      child: Text("취소")),
                  TextButton(
                      onPressed: (){
                        setState(() {
                          inputInitAge = (_selectedAge + 1).toString();
                          user.age = _selectedAge + 1;
                        });
                        Navigator.pop(context);
                      },
                      child: Text("완료"))
                ],
              ),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future save() async {
    var res = await http.post(Uri.parse(registerURL),
        headers: headers,
        body: json.encode({
          'email': user.email,
          'pwd': user.pwd,
          'id': user.id,
          'name': user.name,
          'gender': user.gender,
          'age': user.age
        }));
    print(res.body);
  }

  Future printError() async {
    print("로그인 중 에러 발생");
  }

  // 성별 토글 컨트롤러
  TextEditingController ageController = TextEditingController();

  String inputInitAge = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("MOGGOJI"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 36),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextFormField(
                              // 회원가입을 위한 컨트롤러 및 처리 (중요!!!!)
                              controller: TextEditingController(text: user.id),
                              onChanged: (val) {
                                user.id = val;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "ID is Empty!";
                                }
                                return "";
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'ID',
                                hintText: 'Enter your ID here...',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: TextFormField(
                                controller:
                                    TextEditingController(text: user.email),
                                onChanged: (val) {
                                  user.email = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email is Empty!";
                                  }
                                  return "";
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  hintText: 'Enter your email here...',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: TextFormField(
                                controller: TextEditingController(text: user.pwd),
                                obscureText: true,
                                onChanged: (val) {
                                  user.pwd = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password is Empty!";
                                  }
                                  return "";
                                },
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Enter your password here...',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: InkWell(
                                    // onTap: () => setState(),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                // validator:
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  hintText: 'Confirm password here...',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: InkWell(
                                    // onTap: () => setState(),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                      size: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: TextFormField(
                                controller:
                                    TextEditingController(text: user.name),
                                onChanged: (val) {
                                  user.name = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Name is Empty!";
                                  }
                                  return "";
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Your Name',
                                  hintText: 'Enter your name here...',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: TextFormField(
                                controller: TextEditingController(
                                    text: inputInitAge),
                                onTap: () {
                                  _showDialog(
                                      CupertinoPicker(
                                          backgroundColor: Colors.white,
                                          itemExtent: 30.0,
                                          scrollController: FixedExtentScrollController(
                                            initialItem: _selectedAge,
                                          ),
                                          onSelectedItemChanged: (int selectedItem) {
                                            setState(() {
                                              _selectedAge = selectedItem;
                                              print(_selectedAge);
                                            });
                                          },
                                          children: List<Widget>.generate(
                                              ageList.length, (int index) {
                                            return Center(child: Text(
                                                ageList[index].toString()));
                                          })
                                      )
                                  );
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Age is Empty!";
                                  }
                                  return "";
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Your Age',
                                  hintText: 'Enter your Age here...',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                // keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Radio(
                                      value: 'Male',
                                      groupValue: user.gender,
                                      onChanged: (val) {
                                        setState(() {
                                          user.gender = val!;
                                        });
                                      },
                                      activeColor: Colors.black,
                                    ),
                                    Text("Male"),
                                    Radio(
                                      value: 'Female',
                                      groupValue: user.gender,
                                      onChanged: (val) {
                                        setState(() {
                                          user.gender = val!;
                                        });
                                      },
                                      activeColor: Colors.black,
                                    ),
                                    Text("Female"),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shadowColor: Colors.yellow,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  try {
                                    user.age = int.tryParse(inputInitAge)??0;
                                    save();
                                    // 회원가입에 성공한 경우 다이얼로그 표시
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('회원가입 성공'),
                                        content: Text('로그인 페이지로 이동합니다.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // 다이얼로그 닫기
                                              Navigator.of(context).pop();
                                              // 로그인 화면으로 이동
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) => MyApp(),
                                                ),
                                              );
                                            },
                                            child: Text('확인'),
                                          ),
                                        ],
                                      ),
                                    );
                                  } catch (e) {
                                    // 회원가입에 실패한 경우 다이얼로그 표시
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('회원가입 실패'),
                                        content: Text('회원가입에 실패했습니다.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // 다이얼로그 닫기
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('확인'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                                child: Row(children: [
                                  Text(
                                    "회원가입",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
