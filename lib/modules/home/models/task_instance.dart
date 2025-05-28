import '../home.dart';

class TaskInstance {
  final int? taskInstanceId;
  final int taskId;
  final TaskStatus taskStatus;
  final String? createdAt;

  TaskInstance({
    this.taskInstanceId,
    required this.taskId,
    required this.taskStatus,
    this.createdAt,
  });

  factory TaskInstance.fromJson(Map<String, dynamic> json) {
    return TaskInstance(
      taskInstanceId: json['id'],
      taskId: json['task_id'],
      taskStatus: TaskStatus.values[json['task_status']],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': taskInstanceId,
      'task_id': taskId,
      'task_status': taskStatus.index,
    };
  }
}
