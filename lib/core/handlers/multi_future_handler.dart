import 'package:dio/dio.dart';
import 'package:signals/signals.dart';

class MultiFutureHandler<F, S, T> {
  final AsyncSignal<T> future;

  final Future<F> firstFunction;

  final Future<S> secondFunction;

  final Future<T> Function()? noConnectionBuilder;

  final Future<T> Function(F firstResult, S secondResult) resultBuilder;
  Future? Function(T value)? onValue;
  void Function(Object e, StackTrace s)? catchError;

  MultiFutureHandler({
    this.noConnectionBuilder,
    required this.future,
    required this.firstFunction,
    required this.secondFunction,
    required this.resultBuilder,
    this.onValue,
    this.catchError,
  });

  Future<void> call() async {
    try {
      future.value = AsyncLoading<T>();

      final firstRes = await firstFunction;
      final secondRes = await secondFunction;

      final merged = await resultBuilder(firstRes, secondRes);
      if (onValue != null) {
        await onValue!(merged);
      }
      future.value = AsyncData<T>(merged);
    } catch (e, s) {
      if (e is DioException &&
          e.type == DioExceptionType.connectionError &&
          noConnectionBuilder != null) {
        await noConnectionBuilder!().then((value) {
          future.value = AsyncData<T>(value);
        });
        return;
      }

      future.value = AsyncError(e, s);
      if (catchError != null) {
        catchError!(e, s);
        return;
      }
      rethrow;
    }
  }
}
