class Task{
  final int id;
  final String pwd;

  Task({
    required this.id,
    required this.pwd
});

  factory Task.fromMap(Map taskMap) {
    return Task(
    id: taskMap['id'],
    pwd: taskMap['pwd']
    );
  }
}