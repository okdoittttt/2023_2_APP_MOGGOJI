class Notice {
  int number;
  String title;
  String content;
  String writer;
  String date;
  String category;

  Notice({
    required this.number,
    required this.title,
    required this.content,
    required this.writer,
    required this.date,
    required this.category,
  });

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
        number: json['number'],
        title: json['title'],
        content: json['content'],
        writer: json['writer'],
        date: json['date'],
        category: json['category']);
  }
}
