class Survey {
  double survey_number;
  int survey_type;
  String survey_title;
  String survey_creator;
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
    required this.survey_number,
    required this.survey_type,
    required this.survey_title,
    required this.survey_creator,
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
        survey_number: json['survey_number'],
        survey_title: json['survey_title'],
        survey_type: json['survey_type'],
        survey_creator: json['survey_creator'],
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
