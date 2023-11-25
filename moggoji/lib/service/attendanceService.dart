import 'dart:convert';

import 'package:moggoji/service/globals.dart';
import 'package:http/http.dart' as http;

class Attendance {
  // 랜덤 숫자 생성
  Future<int> generateRandomNumber() async {
    final response = await http.get(Uri.parse(generateNumber));
    int randomNumber = 0;
    if (response.statusCode == 200) {
      randomNumber = json.decode(response.body);
    }

    return randomNumber;
  }
  // 출석 등록
  Future<void> involved(String postURL) async {
    final response = await http.post(Uri.parse(postURL));
  }

  // 번호 확인 및 출석 메서드
  Future<void> checkNumber(int enteredNumber, String attenURL) async {
    String attendanceURL = attenURL;
    String postURL = "${checkNumberURL}/$enteredNumber";
    final response = await http.post(Uri.parse(postURL));

    await _handleResponse(response, attendanceURL);
  }

  Future<void> _handleResponse(http.Response response, String attendanceURL) async {
    String postURL = attendanceURL;
    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      print("===========responseBody============");
      print(responseBody);

      if (responseBody == "true") {
        print("checkPoint");
        final responses = await http.post(Uri.parse(postURL));
      } else {
        // 출석번호 오류시 반환할 모달창 구현
        print("출석번호 오류 발생 !!!");
      }
    }
  }
}