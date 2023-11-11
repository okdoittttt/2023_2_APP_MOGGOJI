import 'dart:convert';

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
    'gender': '',
    'age': 0
  });

  Future save() async {
    var res = await http.post(Uri.parse(registerURL),
        headers: headers,
        body:
            json.encode({'email': user.email, 'pwd': user.pwd, 'id': user.id, 'name': user.name, 'gender': user.gender, 'age': user.age}));
    print(res.body);
  }

  ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    print(pickedFile);

    if (pickedFile != null) {
      // 멀티파트 요청을 생성합니다.
      var request = http.MultipartRequest('POST', Uri.parse(imageAddURL));
      request.headers.addAll(headers);

      // 이미지 파일을 추가합니다.
      var fileStream = http.ByteStream(Stream.castFrom(pickedFile.openRead()));
      var length = await pickedFile.length();
      var multipartFile = http.MultipartFile('image', fileStream, length,
          filename: pickedFile.path);

      request.files.add(multipartFile);

      // 요청을 보냅니다.
      var response = await http.Response.fromStream(await request.send());

      // 서버 응답 확인
      if (response.statusCode == 200) {
        print('Uploaded!');
      } else {
        print('Failed to upload: ${response.statusCode}');
      }
    }
  }


  Future printError() async {
    print("로그인 중 에러 발생");
  }

  // 성별 토글 컨트롤러
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              // controller:
                              // obscureText:,
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
                              controller:
                              TextEditingController(text: user.age.toString()),
                              onChanged: (val) {
                                user.age = int.tryParse(val) ?? 0;
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
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Row(
                                children: [
                                  Radio(value: 'Male', groupValue: user.gender, onChanged: (val) {
                                    setState(() {
                                      user.gender = val!;
                                    });
                                  }),
                                  Text("Male"),
                                  Radio(value: 'Female', groupValue: user.gender, onChanged: (val) {
                                    setState(() {
                                      user.gender = val!;
                                    });
                                  }),
                                  Text("Female"),
                                  ElevatedButton(onPressed: pickImage, child: Text("이미지 선택")),
                                ],
                              )
                          ),
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
                              onPressed: () {
                                try {
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
                                            Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder: (context) => MyApp(),),
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
                              child: Icon(
                                Icons.arrow_forward,
                                size: 30,
                              ),
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
    );
  }
}
