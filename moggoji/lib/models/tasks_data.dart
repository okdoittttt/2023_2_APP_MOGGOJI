import 'package:flutter/cupertino.dart';
import 'package:moggoji/models/task.dart';
import 'package:moggoji/service/database_service.dart';

class TasksData  extends ChangeNotifier{
  List<Task> tasks = [];

  void addTask(String TaskPwd) async {
    Task task = await DatabaseService.addTask(TaskPwd);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    // DatabaseService.updateTask(task.id);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    // DatabaseService.deleteTask(task.id);
    notifyListeners();
  }
}