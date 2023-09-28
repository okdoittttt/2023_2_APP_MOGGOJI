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

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     number: json['number'],
  //     id: json['id'],
  //     pwd: json['pwd'],
  //     email: json['email'],
  //   );

    factory User.fromMap(Map<String, dynamic> userMap) {
      return User(
        number: userMap['number'] ?? 0,  // number 값이 없을 경우 0으로 초기화
        id: userMap['id'] ?? '',        // id 값이 없을 경우 빈 문자열로 초기화
        pwd: userMap['pwd'] ?? '',      // pwd 값이 없을 경우 빈 문자열로 초기화
        email: userMap['email'] ?? '',  // email 값이 없을 경우 빈 문자열로 초기화
      );
    }

  // factory User.fromMap(Map userMap) {
  //   return User(
  //     number: userMap['number'],
  //     id: userMap['id'],
  //     pwd: userMap['pwd'],
  //     email: userMap['email'],
  //   );
  // }
}