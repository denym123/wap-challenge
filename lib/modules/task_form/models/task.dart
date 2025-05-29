import 'models.dart';

class Task {
  final int taskId;
  final String name;
  final String description;
  List<Field>? fields;

  Task({
    required this.taskId,
    required this.name,
    required this.description,
    this.fields,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      taskId: map['id'],
      name: map['task_name'],
      description: map['description'],
    );
  }
}
