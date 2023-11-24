class Answer {
  int surveyNumber;
  int surveyType;
  String surveyTitle;
  String surveyCreator;
  int answer1;
  int answer2;
  int answer3;
  int answer4;
  int answer5;
  int answer6;
  int answer7;
  int answer8;
  int answer9;
  int answer10;
  int answer11;
  int answer12;
  int answer13;
  int answer14;
  int answer15;

  Answer({
    required this.surveyNumber,
    required this.surveyType,
    required this.surveyTitle,
    required this.surveyCreator,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.answer5,
    required this.answer6,
    required this.answer7,
    required this.answer8,
    required this.answer9,
    required this.answer10,
    required this.answer11,
    required this.answer12,
    required this.answer13,
    required this.answer14,
    required this.answer15,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
        surveyNumber: json['surveyNumber'],
        surveyTitle: json['surveyTitle'],
        surveyType: json['surveyType'],
        surveyCreator: json['surveyCreator'],
        answer1: json['answer1'],
        answer2: json['answer2'],
        answer3: json['answer3'],
        answer4: json['answer4'],
        answer5: json['answer5'],
        answer6: json['answer6'],
        answer7: json['answer7'],
        answer8: json['answer8'],
        answer9: json['answer9'],
        answer10: json['answer10'],
        answer11: json['answer11'],
        answer12: json['answer12'],
        answer13: json['answer13'],
        answer14: json['answer14'],
        answer15: json['answer15']);
  }
}
