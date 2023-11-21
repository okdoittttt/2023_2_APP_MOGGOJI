class Survey {
  int surveyNumber;
  int surveyType;
  String surveyTitle;
  String surveyCreator;
  String content1;
  String content2;
  String content3;
  String content4;
  String content5;
  String content6;
  String content7;
  String content8;
  String content9;
  String content10;
  String content11;
  String content12;
  String content13;
  String content14;
  String content15;

  Survey({
    required this.surveyNumber,
    required this.surveyType,
    required this.surveyTitle,
    required this.surveyCreator,
    required this.content1,
    required this.content2,
    required this.content3,
    required this.content4,
    required this.content5,
    required this.content6,
    required this.content7,
    required this.content8,
    required this.content9,
    required this.content10,
    required this.content11,
    required this.content12,
    required this.content13,
    required this.content14,
    required this.content15,
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
        surveyNumber: json['surveyNumber'],
        surveyTitle: json['surveyTitle'],
        surveyType: json['surveyType'],
        surveyCreator: json['surveyCreator'],
        content1: json['content1'],
        content2: json['content2'],
        content3: json['content3'],
        content4: json['content4'],
        content5: json['content5'],
        content6: json['content6'],
        content7: json['content7'],
        content8: json['content8'],
        content9: json['content9'],
        content10: json['content10'],
        content11: json['content11'],
        content12: json['content12'],
        content13: json['content13'],
        content14: json['content14'],
        content15: json['content15']);
  }
}
