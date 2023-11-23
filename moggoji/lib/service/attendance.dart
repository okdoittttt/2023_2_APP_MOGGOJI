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

}