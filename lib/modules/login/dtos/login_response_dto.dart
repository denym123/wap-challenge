class LoginResponseDto {
  final String accessToken;
  final String refreshToken;

  LoginResponseDto({required this.accessToken, required this.refreshToken});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
