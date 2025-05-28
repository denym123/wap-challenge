import 'package:flutter/cupertino.dart';
import 'package:signals/signals.dart';

/// DB = tipo retornado pelo banco
/// API = tipo retornado pela API
/// T = tipo final que você quer colocar no AsyncSignal
class MultiFutureHandler<DB, API, T> {
  final AsyncSignal<T> future;

  /// a
  final Future<DB> dbFunction;

  /// apiFunction = função que busca os dados na API
  final Future<API> apiFunction;

  /// resultBuilder = função que constrói o T final usando a função que foi passada
  final Future<T> Function(DB dbResult, API apiResult) resultBuilder;
  ValueSetter<T>? onValue;
  void Function(Object e, StackTrace s)? catchError;

  MultiFutureHandler({
    required this.future,
    required this.dbFunction,
    required this.apiFunction,
    required this.resultBuilder,
    this.onValue,
    this.catchError,
  });

  Future<void> call() async {
    try {
      future.value = AsyncLoading<T>();

      /// Executa as duas operações (você pode fazer em sequência ou paralelamente)
      final dbRes = await dbFunction;
      final apiRes = await apiFunction;

      /// Constrói o T final usando a função que foi passada
      final merged = await resultBuilder(dbRes, apiRes);

      future.value = AsyncData<T>(merged);
      if (onValue != null) onValue!(merged);
    } catch (e, s) {
      future.value = AsyncError(e, s);
      if (catchError != null) {
        catchError!(e, s);
        return;
      }
      rethrow;
    }
  }
}
