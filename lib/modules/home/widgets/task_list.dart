import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
import '../home.dart';
import 'task_widget.dart';

class TaskList extends StatelessWidget {
  final HomeController controller;
  final List<TaskModel> tasks;
  const TaskList({super.key, required this.tasks, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: tasks.length,
        separatorBuilder: (context, index) => const SizedBox(height: 28),
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskWidget(
            onTap: () {
              Modular.to.pushNamed(Routes.taskForm, arguments: task.taskId);
            },
            taskStatus: task.taskStatus,
            percentage: task.percentage ?? 0,
            title: task.taskName,
            subtitle: task.description,
            createdAt: task.createdAt,
          );
        },
      ),
    );
  }
}
