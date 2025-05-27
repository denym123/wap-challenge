import '../home.dart';

class Task {
  final int id;
  final String taskName;
  final String description;
  final List<Field> fields;

  Task({
    required this.id,
    required this.taskName,
    required this.description,
    required this.fields,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      taskName: json['task_name'],
      description: json['description'],
      fields: List<Field>.from(
        (json['fields'] as List).map((e) => Field.fromJson(e)),
      ),
    );
  }
}
