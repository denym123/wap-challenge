import 'package:dio/dio.dart';

class HttpException implements Exception {
  final String? url;
  final DioException? dioException;
  final dynamic data;

  HttpException({required this.url, required this.dioException, this.data});

  @override
  String toString() {
    return 'HTTP Exception: $url\n'
        'statusCode: ${dioException?.response?.statusCode}\n'
        'Data: $data';
  }

  String? get message {
    //TODO: recuperar uma formar de pegar a mensagem de erro vinda da requisição
    return null;
  }

  int? get statusCode => dioException?.response?.statusCode;

  Map<String, dynamic>? get request => dioException?.requestOptions.data;

  Map<String, dynamic>? get response => dioException?.response?.data;
}
