class User {
  int id;
  String? userName;
  String name;
  String? profile;

  User({required this.name, this.profile, this.userName, required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['login'],
      name: json['name'],
      profile: json['profile'],
    );
  }
}
