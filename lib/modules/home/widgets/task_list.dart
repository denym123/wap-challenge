import 'package:flutter/material.dart';

import '../home.dart';
import 'task_widget.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: tasks.length,
        separatorBuilder: (context, index) => const SizedBox(height: 28),
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskWidget(
            title: task.taskName,
            subtitle: task.description,
            answered: 2,
            total: 4,
            createdAt: DateTime.now().toString(),
          );
        },
      ),
    );
  }
}
