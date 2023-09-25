import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:moggoji/models/user.dart';
import '../pages/main_screen.dart';
import 'register_page.dart';
import 'package:moggoji/service/globals.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User.fromMap({
    'number': 0,
    'id': '',
    'pwd': '',
    'email': '',
  });

  Future login() async {
    var res = await http.post(Uri.parse(loginURL),
      headers: headers,
      body: json.encode({'email':user.email, 'pwd': user.pwd}));

    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Scaffold(
          backgroundColor: Colors.lightBlue,
          body: Form(
            key: _formKey,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey, Colors.purple],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0.87, -1),
                  end: AlignmentDirectional(-0.87, 1),
                ),
              ),
              alignment: AlignmentDirectional(0.00, -1.00),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 32),
                      child: Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          '모꼬지',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 570,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(32, 32, 32, 32),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '로그인/회원가입',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 24),
                                    child: Text(
                                      '동아리 출석 인원 관리 애플리케이션',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: TextEditingController(text: user.id),
                                        onChanged: (val) {
                                          user.id = val;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Email is Empty!";
                                          }
                                          return "";
                                        },
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Email',
                                        ),
                                        keyboardType: TextInputType.emailAddress,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: TextEditingController(text: user.pwd),
                                        onChanged: (val) {
                                          user.pwd = val;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Password is Empty!";
                                          }
                                          return "";
                                        },
                                        autofocus: true,
                                        autofillHints: [AutofillHints.password],
                                        // obscureText: !_model.passwordVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 16),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          try {
                                            login();
                                            print("로그인 메서드 진입");

                                          } catch (e) {
                                            print(e);
                                          }


                                          Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                                        },
                                        child: Text("Sign In"),
                                      )),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 12),
                                    child: RichText(
                                      textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '아직 계정이 없으신가요?  ',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                              text: '여기를 눌러 회원가입',
                                              recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage())),
                                              style: TextStyle(color: Colors.purple))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// List<User>? users;
//
// getUsers() async {
//   users = await DatabaseService.getUsers();
//   print(users);
//   print("object");
//   Provider.of<UsersData>(context, listen: false).users = users!;
//   setState(() {
//   });
// }

// @override
// void initState() {
//   super.initState();
//   getUsers();
// }