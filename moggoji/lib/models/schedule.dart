class Schedule {
  int number;
  String title;
  String writer;
  String location;
  String date;

  Schedule(
      {required this.number,
      required this.title,
      required this.writer,
      required this.location,
      required this.date});

  // FromJson으로 받는 방식
  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      number: json['number'],
      title: json['title'],
      writer: json['writer'],
      location: json['location'],
      date: json['date'],
    );
  }

  // fromMap으로 받는 방식
  // factory Schedule.fromMap(Map scheduleMap) {
  //   return Schedule(
  //       number: scheduleMap['number'],
  //       title: scheduleMap['title'],
  //       writer: scheduleMap['writer'],
  //       location: scheduleMap['location'],
  //       date: scheduleMap['date']);
  // }
}
