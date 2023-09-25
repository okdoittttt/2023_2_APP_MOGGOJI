// import 'package:flutter/cupertino.dart';
// import 'package:moggoji/models/user.dart';
// import 'package:moggoji/service/database_service.dart';
//
// class UsersData  extends ChangeNotifier{
//   List<User> users = [];
//
//   void addUser(String UserId) async {
//     User user = await DatabaseService.addTask(UserId);
//     users.add(user);
//     notifyListeners();
//   }
//
//   void updateUser(User user) {
//     // DatabaseService.updateTask(task.id);
//     notifyListeners();
//   }
//
//   void deleteUSer(User user) {
//     users.remove(user);
//     // DatabaseService.deleteTask(task.id);
//     notifyListeners();
//   }
// }