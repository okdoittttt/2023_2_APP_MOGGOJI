import 'dart:typed_data';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:moggoji/service/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class JwtTokenUtil {
  String? userId;
  String? userEmail;
  String? userName;
  String? userGender;
  int? userImgNumber;

  Uint8List imageDataList = Uint8List.fromList([]);

  // 토큰 로드
  Future<String?> loadToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("token");
  }

  // 토큰 저장
  Future<void> saveToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
  }

  // 로그아웃
  Future logout(String postURL) async {
    String logoutURL = postURL;
    final response = await http.post(Uri.parse(logoutURL),
      headers: headers);
  }

  // 회원 정보 불러오기
  Future<void> getUserInfo() async {
    String? token = await loadToken();
    print("Token : ${token}");

    if(token != null) {
      Map<String, String> hearders = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      userId = decodedToken["id"];
      userEmail = decodedToken["email"];
      userName = decodedToken["name"];
      userGender = decodedToken["gender"];
      userImgNumber = decodedToken["imageNumber"];
    } else {
      print("Token is null. Unable to decode");
    }

    String imgURL = '$imageDisplayURL/${userImgNumber}';

    final response = await http.get(Uri.parse(imgURL));

    await _handleResponse(response);
  }

  Future<void> _handleResponse(http.Response response) async {
    if(response.statusCode == 200) {
      Uint8List imageData = Uint8List.fromList(response.bodyBytes);
      imageDataList = imageData;
    }
    else {
      throw Exception("Failed to load Image");
    }
  }

}
