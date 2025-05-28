import '../enums/task_status.dart';

class TaskModel {
  final int taskId;
  final String taskName;
  final String description;
  final double? percentage;
  final String? createdAt;
  final TaskStatus taskStatus;

  TaskModel({
    required this.taskId,
    required this.taskStatus,
    required this.taskName,
    required this.description,
    this.percentage,
    this.createdAt,
  });
}
