import 'package:signals/signals.dart';

class FutureHandler<T> {
  final AsyncSignal<T> future;
  Future<T> repositoryFunction;
  Future<void> Function(T)? onValue;
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
      if (onValue != null) {
        await onValue!(response);
      }
      future.value = AsyncData(response);
    } catch (e, s) {
      if (noConnectionBuilder != null) {
        final result = await noConnectionBuilder!();
        future.value = AsyncData(result);
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
