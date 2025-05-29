import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/core.dart';
import '../models/task.dart';
import '../models/task_instance.dart';

mixin TaskFormVariables {
  AsyncSignal<Task> taskAS = AsyncSignal(AsyncLoading());
  Debouncer debouncer = Debouncer(milliseconds: 500);
  int? taskId;
  TaskInstance? taskInstance;
  Map<int, TextEditingController> controllers = {};
}
