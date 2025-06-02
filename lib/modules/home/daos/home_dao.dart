import 'package:sqflite/sqlite_api.dart';

import '../../../core/core.dart';
import '../home.dart';

class HomeDao extends RepositoryLifeCycle {
  Future<void> saveTasks(List<Task> tasks, int userId) async {
    final db = await SqliteConnectionFactory().database;
    final batch = db.batch();
    for (var task in tasks) {
      final taskId = await db.insert(
        Tables.task,
        task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      for (var field in task.fields) {
        batch.insert(
          Tables.field,
          field.toMap(taskId),
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
    }
    await batch.commit();
  }

  Future<List<TaskInstance>> getTaskInstances(int userId) async {
    final db = await SqliteConnectionFactory().database;
    final taskInstances = await db.query(
      Tables.taskInstance,
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    return taskInstances.map((e) => TaskInstance.fromJson(e)).toList();
  }

  Future<List<Task>> getTasks() async {
    final db = await SqliteConnectionFactory().database;
    final tasks = await db.query(Tables.task);
    return List.from(tasks.map((e) => Task.fromMap(e)));
  }

  Future<void> clearTaskInstances() async {
    final db = await SqliteConnectionFactory().database;
    await db.delete(Tables.taskInstance);
  }

  Future<bool> verifyTaskInstance(int taskId, userId) async {
    final db = await SqliteConnectionFactory().database;
    final taskInstance = await db.query(
      Tables.taskInstance,
      where: 'task_id = ?, user_id =?',
      whereArgs: [taskId, userId],
    );
    return taskInstance.isNotEmpty;
  }
}
