import 'package:shared_preferences/shared_preferences.dart';

class JwtTokenUtil {

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
}
