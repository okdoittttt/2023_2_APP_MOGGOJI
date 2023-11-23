class Schedule {
  int number;
  String title;
  String writer;
  String location;
  String date;
  String content;
  int fee;
  String participantName;

  Schedule(
      {required this.number,
      required this.title,
      required this.writer,
      required this.location,
      required this.date,
      required this.content,
      required this.fee,
      required this.participantName});

  // FromJson으로 받는 방식
  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
        number: json['number'],
        title: json['title'],
        writer: json['writer'],
        location: json['location'],
        date: json['date'],
        content: json['content'],
        fee: json['fee'],
        participantName: json['participantName']);
  }
}
