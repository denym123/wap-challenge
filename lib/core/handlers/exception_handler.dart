import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../core.dart';

class ExceptionHandler {
  final Object error;
  final StackTrace? stackTrace;
  final String _defaultErrorMessage =
      'Não foi possível realizar essa operação no momento.\nTente novamente mais tarde.';

  ExceptionHandler(this.error, this.stackTrace) {
    log('==================================================================');
    log('============================= ERROR ==============================');
    log('==================================================================');
    log(error.toString());
    log(stackTrace.toString());

    GlobalException(error, stackTrace);

    if (kDebugMode) {
      _handlerToModal(error);
    }
  }

  void _handlerToModal(Object e) {
    if (e.runtimeType != DioException) {
      Messages.error(_defaultErrorMessage);
      return;
    }

    //TODO: configurar crashlytics
    final DioException dioException = e as DioException;

    Messages.error(
      dioException.response?.data['error'] ?? _defaultErrorMessage,
    );
  }

  String? getMessage(DioException e) {
    //TODO: recuperar a mensagem da dioException ou a padrão, caso não tenha.

    return null;
  }
}
