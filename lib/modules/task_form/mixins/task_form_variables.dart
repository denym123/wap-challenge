import 'package:flutter/material.dart';

import '../models/task.dart';
import '../models/task_instance.dart';

mixin TaskFormVariables {
  int? taskId;
  Task? task;
  TaskInstance? taskInstance;
  Map<int, TextEditingController> controllers = {};
}
