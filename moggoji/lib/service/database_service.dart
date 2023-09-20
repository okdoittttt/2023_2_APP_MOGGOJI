import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moggoji/models/user.dart';
import 'package:moggoji/service/globals.dart';

class DatabaseService{
  static Future<User> addTask(String id) async {
    Map data = {
      "id": id,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/register');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    User user = User.fromMap(responseMap);

    return user;
  }

  static Future<List<User>> getUsers() async {
    var url = Uri.parse(baseURL);
    http.Response response = await http.get(
      url,
      headers: headers,
    );

    print(baseURL);
    print(response.body);
    List reponseList = jsonDecode(response.body);
    List<User> users = [];

    for (Map userMap in reponseList) {
      User user = User.fromMap(userMap);
      users.add(user);
    }
    return users;
  }

}

// static Future<List<User>> getTask() async {
// var url = Uri.parse(baseURL);
// http.Response response = await http.get(
// url,
// headers: headers,
// );
// print(response.body);
// List responseList = jsonDecode(response.body);
// List<User> users = [];
// for (Map taskMap in responseList) {
// User user = User.fromMap(taskMap);
// users.add(user);
// }
// return users;
// }