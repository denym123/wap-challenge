import '../../../core/core.dart';

class Field {
  final int id;
  final String label;
  final bool required;
  final String fieldType;

  Field({
    required this.id,
    required this.label,
    required this.required,
    required this.fieldType,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      id: json['id'],
      label: json['label'],
      required: json['required'],
      fieldType: json['field_type'],
    );
  }

  Map<String, dynamic> toMap(int taskId) {
    return {
      'id': id,
      'label': label,
      'required': required.toDb(),
      'field_type': fieldType,
      'task_id': taskId,
    };
  }
}
