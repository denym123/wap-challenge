import '../../modules.dart';

class TaskInstance {
  final int id;
  final int taskId;
  final String createdAt;
  TaskStatus? taskStatus;

  TaskInstance({
    this.taskStatus,
    required this.id,
    required this.taskId,
    required this.createdAt,
  });

  factory TaskInstance.fromMap(Map<String, dynamic> json) {
    return TaskInstance(
      id: json['id'],
      taskId: json['task_id'],
      createdAt: json['created_at'],
      taskStatus: TaskStatus.values[json['task_status']],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task_id': taskId,
      'created_at': createdAt,
      'task_status': taskStatus?.index ?? 0,
    };
  }
}
