import 'package:flutter/cupertino.dart';
import 'package:signals/signals.dart';

class FutureHandler<T> {
  final AsyncSignal<T> future;
  Future<T> repositoryFunction;
  ValueSetter<T>? onValue;
  void Function(Object e, StackTrace s)? catchError;

  FutureHandler({
    required this.future,
    required this.repositoryFunction,
    this.onValue,
    this.catchError,
  });

  Future<void> call() async {
    future.value = AsyncLoading<T>();
    repositoryFunction
        .then((T response) {
          future.value = AsyncData(response);
          if (onValue != null) onValue!(response);
        })
        .catchError((Object e, StackTrace s) {
          future.value = AsyncError(e, s);
          if (catchError != null) catchError!(e, s);
          throw e;
        });
  }
}
