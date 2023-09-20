class User {
  int number;
  String id;
  String pwd;
  String email;

  User({
    required this.number,
    required this.id,
    required this.pwd,
    required this.email,
});

  factory User.fromMap(Map userMap) {
    return User(
      number: userMap['number'],
      id: userMap['id'],
      pwd: userMap['pwd'],
      email: userMap['email'],
    );
  }
}