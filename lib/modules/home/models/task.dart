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
    this.fields = const [],
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

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      taskId: map['id'],
      taskName: map['task_name'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': taskId, 'task_name': taskName, 'description': description};
  }
}
