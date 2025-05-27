import '../../../core/core.dart';
import '../../login/login.dart';

class LoginRepository extends RepositoryLifeCycle {
  Future<LoginResponseDto> login(LoginRequestDto loginRequestDto) async {
    final response = await httpAdapter.post(
      '/auth',
      data: loginRequestDto.toJson(),
    );
    return LoginResponseDto.fromJson(response.data);
  }
}
