const Map<String, String> headers = {"Content-Type": "application/json"};
// 유저 관리 API URL
const String UserbaseURL = "http://localhost:9191/users";
const String registerURL = "$UserbaseURL/register";
const String loginURL = "$UserbaseURL/login";

// More Page
const String moreURL = "$UserbaseURL/getSome";

// 일정 관리 API URL
const String TaskbaseURL = "http://localhost:9191/schedule";
const String getTask = "$TaskbaseURL/";
const String addTask = "$TaskbaseURL/addTask";