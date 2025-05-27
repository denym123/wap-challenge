import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
import '../login.dart';

class LoginController with ControllerLifeCycle, LoginVariables {
  final LocalSecureStorage _secureStorage = Modular.get<LocalSecureStorage>();
  final LoginRepository _loginRepository;

  LoginController({required LoginRepository loginRepository})
    : _loginRepository = loginRepository;

  Future<void> login() async {
    FutureHandler(
      future: loginAS,
      repositoryFunction: _loginRepository.login(
        LoginRequestDto(
          userName: userController.text,
          password: passwordController.text,
        ),
      ),
      onValue: (value) async {
        await Future.wait([
          _secureStorage.write(
            LocalSecureStorageConstants.accessToken,
            value!.accessToken,
          ),
          _secureStorage.write(
            LocalSecureStorageConstants.refreshToken,
            value.refreshToken,
          ),
        ]);
        Modular.to.navigate(Route.home);
      },
      catchError: (e, s) {
        // Normalmente o erro vem do retorno da API, mas como neste caso não,
        // é necessário verificar o status code.
        if ((e as DioException).response?.statusCode == HttpStatus.forbidden) {
          Messages.error('Usuário ou senha inválidos');
        }
      },
    ).call();
  }
}
