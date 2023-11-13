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


// 공지사항 관리 API URL
const String NoticebaseURL = "http://localhost:9191/notice";
// const String getNotice = "$NoticebaseURL/";
const String addNotice = "$NoticebaseURL/addNotice";
const String findNoticeByCategoryURL = "$NoticebaseURL/getNoticeByCategory";

// 설문조사 관리 API URL
const String SurveybaseURL = "http://localhost:9191/survey";
const String addSurvey = "$SurveybaseURL/addSurvey";
const String findSurveyByNumberURL = "$SurveybaseURL/getSurveyByNumber/{survey_number}";