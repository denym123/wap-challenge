class User {
  final int id;
  final String userName;
  final String name;
  final String profile;

  User({
    required this.name,
    required this.profile,
    required this.userName,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['login'],
      name: json['name'],
      profile: json['profile'],
    );
  }
}
