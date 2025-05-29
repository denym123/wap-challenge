import '../../../core/core.dart';

import '../../home/enums/task_status.dart';
import '../models/field_response.dart';
import '../models/models.dart';
import '../models/task_instance.dart';

class TaskFormDao {
  Future<Task> getTask(int taskId) async {
    final db = await SqliteConnectionFactory().database;
    final result = await db.query(
      Tables.task,
      where: 'id = ?',
      whereArgs: [taskId],
    );
    return Task.fromMap(result.first);
  }

  Future<List<Field>> getFields(int taskId) async {
    final db = await SqliteConnectionFactory().database;
    final result = await db.query(
      Tables.field,
      where: 'task_id = ?',
      whereArgs: [taskId],
    );
    return List<Field>.from(result.map((e) => Field.fromMap(e)));
  }

  Future<int> createTaskInstance(int taskId) async {
    final db = await SqliteConnectionFactory().database;
    final result = await db.insert(Tables.taskInstance, {
      'task_id': taskId,
      'task_status': TaskStatus.pending.index,
    });
    return result;
  }

  Future<void> createFieldResponse(
    int taskInstanceId,
    int fieldId,
    String value,
  ) async {
    final db = await SqliteConnectionFactory().database;
    await db.insert(Tables.fieldResponse, {
      'task_instance_id': taskInstanceId,
      'field_id': fieldId,
      'value': value,
    });
  }

  Future<TaskInstance?> getTaskInstance(int taskId) async {
    final db = await SqliteConnectionFactory().database;
    final result = await db.query(
      Tables.taskInstance,
      where: 'task_id = ?',
      whereArgs: [taskId],
    );
    return result.isNotEmpty ? TaskInstance.fromMap(result.first) : null;
  }

  Future<FieldResponse?> getFieldResponse(
    int taskInstanceId,
    int fieldId,
  ) async {
    final db = await SqliteConnectionFactory().database;
    final result = await db.query(
      Tables.fieldResponse,
      where: 'task_instance_id = ? AND field_id = ?',
      whereArgs: [taskInstanceId, fieldId],
    );
    return result.isNotEmpty ? FieldResponse.fromMap(result.first) : null;
  }

  Future<void> updateTaskInstance(TaskInstance taskInstance) async {
    final db = await SqliteConnectionFactory().database;
    await db.update(
      Tables.taskInstance,
      taskInstance.toMap(),
      where: 'task_id =?',
      whereArgs: [taskInstance.id],
    );
  }

  Future<void> updateFieldResponse(FieldResponse fieldResponse) async {
    final db = await SqliteConnectionFactory().database;
    await db.update(
      Tables.fieldResponse,
      fieldResponse.toMap(),
      where: 'id = ?',
      whereArgs: [fieldResponse.id],
    );
  }
}
