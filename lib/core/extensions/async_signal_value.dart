import 'package:signals/signals.dart';

extension AsyncSignalExtensions<T> on AsyncSignal<T> {
  bool get isLoading => value.isLoading;
}
