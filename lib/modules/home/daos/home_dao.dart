import '../../../core/core.dart';
import '../home.dart';

class HomeDao extends RepositoryLifeCycle {
  Future<void> saveTasks(List<Task> tasks, int userId) async {
    final db = await SqliteConnectionFactory().database;
    final batch = db.batch();
    for (var task in tasks) {
      final taskId = await db.insert(Tables.task, task.toMap(userId));
      for (var field in task.fields!) {
        batch.insert(Tables.field, field.toMap(taskId));
      }
    }
    await batch.commit();
  }

  Future<List<TaskInstance>> getTaskInstances() async {
    final db = await SqliteConnectionFactory().database;
    final taskInstances = await db.query(Tables.taskInstance);
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

  Future<bool> verifyTaskInstance(int taskId) async {
    final db = await SqliteConnectionFactory().database;
    final taskInstance = await db.query(
      Tables.taskInstance,
      where: 'task_id = ?',
      whereArgs: [taskId],
    );
    return taskInstance.isNotEmpty;
  }
}
