import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('Request: ${options.uri}');
    if (options.data != null && options.data is Map) {
      log('Request: ${jsonEncode(options.data)}');
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Error: ${jsonEncode(err.response?.data)}');
    handler.next(err);
  }
}
