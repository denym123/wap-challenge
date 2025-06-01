import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core.dart';

class AuthInterceptor extends Interceptor {
  final LocalSecureStorage _localSecureStorage =
      Modular.get<LocalSecureStorage>();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _localSecureStorage.read(
      LSSConstants.accessToken,
    );

    options.headers['Authorization'] = 'Bearer $accessToken';
    log('accessToken: $accessToken');
    handler.next(options);
  }
}
