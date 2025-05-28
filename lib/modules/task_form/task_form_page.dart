import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'task_form.dart';

 class TaskFormPage extends StatefulWidget {
  const TaskFormPage({super.key});

  @override
  State<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends PageLifeCycleState<TaskFormController, TaskFormPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
