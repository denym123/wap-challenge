import '../home.dart';

class Task {
  final int taskId;
  final String taskName;
  final String description;
  final List<Field> fields;

  Task({
    required this.taskId,
    required this.taskName,
    required this.description,
    required this.fields,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskId: json['id'],
      taskName: json['task_name'],
      description: json['description'],
      fields: List<Field>.from(
        (json['fields'] as List).map((e) => Field.fromJson(e)),
      ),
    );
  }

  Map<String, dynamic> toMap(int userId) {
    return {
      'id': taskId,
      'task_name': taskName,
      'description': description,
      'user_id': userId,
    };
  }
}
