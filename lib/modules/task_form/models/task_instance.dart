class TaskInstance {
  final int id;
  final int taskId;
  final String createdAt;

  TaskInstance({
    required this.id,
    required this.taskId,
    required this.createdAt,
  });

  factory TaskInstance.fromMap(Map<String, dynamic> json) {
    return TaskInstance(
      id: json['id'],
      taskId: json['task_id'],
      createdAt: json['created_at'],
    );
  }
}
