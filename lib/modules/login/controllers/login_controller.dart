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
        Modular.to.navigate(Routes.home);
      },
      catchError: (e, s) {
        e as DioException;
        final noConnectionError =
            e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.connectionError;

        final userNotFoundError =
            e.response?.statusCode == HttpStatus.forbidden;

        if (noConnectionError) {
          Messages.error('Houve um erro com a sua conexão');
        }

        if (userNotFoundError) {
          Messages.error('Usuário ou senha inválidos');
        }
      },
    ).call();
  }
}
