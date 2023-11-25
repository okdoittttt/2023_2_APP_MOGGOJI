const Map<String, String> headers = {"Content-Type": "application/json"};
// 유저 관리 API URL
const String UserbaseURL = "http://localhost:9191/users";
const String registerURL = "$UserbaseURL/register";
const String loginURL = "$UserbaseURL/login";
const String logoutURL = "$UserbaseURL/logout";

// 이미지 API URL
const String imagebaseURL = "http://localhost:9191/image";
const String imageAddURL = "$imagebaseURL/add";
const String imageDisplayURL = "$imagebaseURL/display";

// 일정 관리 API URL
const String TaskbaseURL = "http://localhost:9191/schedule";
const String getTask = "$TaskbaseURL/";
const String addTask = "$TaskbaseURL/addSchedule";
// const String recordName = "$TaskbaseURL/attendance/recordName";

// 출석 관리 API URL
const String AttendanceURL = "http://localhost:9191/attendance";
const String recordName = "$AttendanceURL/recordName";
const String checkNumberURL = "$AttendanceURL/checkNumber";
const String generateNumber = "$AttendanceURL/generateNumber";
const String attendance = "$AttendanceURL/attenController";


// 공지사항 관리 API URL
const String NoticebaseURL = "http://localhost:9191/notice";
// const String getNotice = "$NoticebaseURL/";
const String addNotice = "$NoticebaseURL/addNotice";
const String findNoticeByCategoryURL = "$NoticebaseURL/getNoticeByCategory";

// 설문조사 관리 API URL
const String SurveybaseURL = "http://localhost:9191/survey";
const String addSurvey = "$SurveybaseURL/addSurvey";
const String getAllSurvey = "$SurveybaseURL/getAllSurvey";
const String findSurveyByTypeURL = "$SurveybaseURL/getSurveyByType";

const String AnswerbaseURL = "http://localhost:9191/answer";
const String addAnswer = "$AnswerbaseURL/addAnswer";
const String getAllBySurveyNumber = "$AnswerbaseURL/getAllBySurveyNumber";