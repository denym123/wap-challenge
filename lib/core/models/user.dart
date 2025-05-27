class User {
  final String name;
  final String profile;

  User({required this.name, required this.profile});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], profile: json['profile']);
  }
}
