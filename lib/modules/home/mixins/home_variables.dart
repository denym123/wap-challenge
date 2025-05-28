import 'package:signals/signals_flutter.dart';

import '../../../core/core.dart';
import '../home.dart';

mixin HomeVariables {
  AsyncSignal<List<TaskModel>> tasksAS = AsyncSignal<List<TaskModel>>(
    AsyncLoading(),
  );
  AsyncSignal<User> userAS = AsyncSignal<User>(AsyncLoading());
}
