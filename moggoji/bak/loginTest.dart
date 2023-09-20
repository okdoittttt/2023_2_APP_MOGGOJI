import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moggoji/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:moggoji/service/globals.dart';

class LoginTest extends StatefulWidget {
  const LoginTest({super.key});

  @override
  State<LoginTest> createState() => _LoginTestState();
}

class _LoginTestState extends State<LoginTest> {
  final _formKey = GlobalKey<FormState>();
  User user = User.fromMap({
    'number': 1,  // number, id, pwd, email 값을 적절하게 설정해야 합니다.
    'id': '',
    'pwd': '',
    'email': '',
  });

  Future save() async {
    var res = await http.post(Uri.parse(registerURL),
        headers: headers,
        body: json.encode({'email': user.email, 'pwd': user.pwd, 'id': user.id}));

    print(res.body);
  }

  Future printError() async {
    print("ERROR !!!!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 700,
              // 가로로 미디어에 맞게 최대로 조정.
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(233, 65, 82, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Login",
                      style: GoogleFonts.pacifico(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Color.fromRGBO(255, 255, 255, 0.8),
                        ),
                      ),
                    ),
                    TextFormField(
                      // 로그인 컨트롤러 사용
                      controller: TextEditingController(text: user.email),
                      onChanged: (val) {
                        user.email = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is Empty!";
                        }
                        return "";
                      },
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                    Container(
                      height: 6,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Password",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Color.fromRGBO(255, 255, 255, 0.8),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: TextEditingController(text: user.pwd),
                      onChanged: (val) {
                        user.pwd = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is Empty!";
                        }
                        return "";
                      },
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                    Container(
                      height: 6,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Text(
                      "아직 계정이 없으신가요 ?",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 70,
              width: 70,
              child: ElevatedButton(
                onPressed: () {
                  try {
                    save();
                  } catch (e) {
                    // save() 함수 실행 중 오류 발생 시 이 부분이 실행됩니다.
                    printError();
                  }
                },
                child: Icon(
                  Icons.arrow_forward,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
