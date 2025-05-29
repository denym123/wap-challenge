class FieldResponse {
  final int id;
  final int taskInstanceId;
  final int fieldId;
  String value;

  FieldResponse({
    required this.id,
    required this.taskInstanceId,
    required this.fieldId,
    required this.value,
  });

  factory FieldResponse.fromMap(Map<String, dynamic> json) {
    return FieldResponse(
      id: json['id'],
      taskInstanceId: json['task_instance_id'],
      fieldId: json['field_id'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task_instance_id': taskInstanceId,
      'field_id': fieldId,
      'value': value,
    };
  }
}
