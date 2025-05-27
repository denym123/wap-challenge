import 'package:signals/signals_flutter.dart';

import '../../../core/core.dart';
import '../home.dart';

mixin HomeVariables {
  AsyncSignal<List<Task>> tasksAS = AsyncSignal<List<Task>>(AsyncLoading());
  AsyncSignal<User> userAS = AsyncSignal<User>(AsyncLoading());
}
