import 'dart:convert';

import 'package:moggoji/models/user.dart';
import 'package:moggoji/service/globals.dart';
import 'package:http/http.dart' as http;

class UserService {
  List<User> userData = [];

  Future<void> getUSerInfo(String name) async {
    String getUserInfoURL = '$getUserInfo/${name}';

    final response = await http.get(Uri.parse(getUserInfoURL));

    await _handleGetUserInfoResponse(response);
  }

  Future<void> _handleGetUserInfoResponse(http.Response response) async {
    if(response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final List<dynamic> data = jsonDecode(responseBody);

      userData = data.map((json) => User.fromMap(json)).toList();
    } else {
      throw Exception("Failed to load userData");
    }
  }
}