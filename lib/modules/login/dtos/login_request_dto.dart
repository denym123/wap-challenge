class LoginRequestDto {
  final String userName;
  final String password;

  LoginRequestDto({required this.userName, required this.password});

  Map<String, dynamic> toJson() {
    return {'login': userName, 'password': password};
  }
}
