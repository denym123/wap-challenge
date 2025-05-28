import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core.dart';

class LogoutInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatus.forbidden) {
      Modular.to.navigate(Routes.login);
    }
    handler.next(err);
  }
}
