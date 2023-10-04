const Map<String, String> headers = {"Content-Type": "application/json"};
// 유저 관리 API URL
const String UserbaseURL = "http://localhost:9191/users";
const String registerURL = "$UserbaseURL/register";
const String loginURL = "$UserbaseURL/login";
const String moreURL = "$UserbaseURL/getUserByEmail"; // More Page

// 일정 관리 API URL
const String TaskbaseURL = "http://localhost:9191/schedule";
const String getTask = "$TaskbaseURL/";
const String addTask = "$TaskbaseURL/addSchedule";


// 공지사항 관리 API URL
const String NoticebaseURL = "http://localhost:9191/notice";
// const String getNotice = "$NoticebaseURL/";
const String addNotice = "$NoticebaseURL/addNotice";
const String findNoticeByCategoryURL = "$NoticebaseURL/getNoticeByCategory";