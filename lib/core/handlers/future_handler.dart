import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals/signals.dart';

class FutureHandler<T> {
  final AsyncSignal<T> future;
  Future<T> repositoryFunction;
  ValueSetter<T>? onValue;
  Future<T> Function()? noConnectionBuilder;
  void Function(Object e, StackTrace s)? catchError;

  FutureHandler({
    required this.future,
    required this.repositoryFunction,
    this.noConnectionBuilder,
    this.onValue,
    this.catchError,
  });

  Future<void> call() async {
    try {
      future.value = AsyncLoading<T>();
      final response = await repositoryFunction;
      future.value = AsyncData(response);
      if (onValue != null) {
        onValue!(response);
      }
    } catch (e, s) {
      if (noConnectionBuilder != null) {
        future.value = AsyncData(await noConnectionBuilder!());
        return;
      }
      if (catchError != null) {
        future.value = AsyncError(e, s);
        catchError!(e, s);
        return;
      }
      rethrow;
    }
  }
}
