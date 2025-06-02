import 'package:sqflite_common/sqlite_api.dart';

import '../../core.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    // 1) Tabela de tarefas (sem user_id)
    batch.execute('''
    CREATE TABLE ${Tables.task} (
      id          INTEGER PRIMARY KEY,
      task_name   TEXT    NOT NULL,
      description TEXT
    );
    ''');

    // 2) Tabela de campos (sem alteração)
    batch.execute('''
    CREATE TABLE ${Tables.field} (
      id          INTEGER PRIMARY KEY,
      task_id     INTEGER NOT NULL,
      label       TEXT    NOT NULL,
      required    INTEGER NOT NULL CHECK (required IN (0,1)),
      field_type  TEXT    NOT NULL,
      FOREIGN KEY(task_id) REFERENCES ${Tables.task}(id) ON DELETE CASCADE
    );
    ''');

    // 3) Tabela de instâncias de tarefa, agora com user_id
    batch.execute('''
    CREATE TABLE ${Tables.taskInstance} (
      id          INTEGER PRIMARY KEY,
      task_id     INTEGER NOT NULL,
      user_id     INTEGER NOT NULL,
      task_status INTEGER NOT NULL,
      created_at  TEXT    DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY(task_id) REFERENCES ${Tables.task}(id) ON DELETE CASCADE
    );
    ''');

    // 4) Tabela de respostas de campo (sem alteração)
    batch.execute('''
    CREATE TABLE ${Tables.fieldResponse} (
      id                 INTEGER PRIMARY KEY,
      task_instance_id   INTEGER NOT NULL,
      field_id           INTEGER NOT NULL,
      value              TEXT,
      FOREIGN KEY(task_instance_id) REFERENCES ${Tables.taskInstance}(id) ON DELETE CASCADE,
      FOREIGN KEY(field_id)           REFERENCES ${Tables.field}(id)        ON DELETE CASCADE
    );
    ''');
  }

  @override
  void update(Batch batch) {
    batch.execute('''
    CREATE TABLE ${Tables.task} (
      id          INTEGER PRIMARY KEY,
      task_name   TEXT    NOT NULL,
      description TEXT
    );
    ''');

    batch.execute('''
    CREATE TABLE ${Tables.field} (
      id          INTEGER PRIMARY KEY,
      task_id     INTEGER NOT NULL,
      label       TEXT    NOT NULL,
      required    INTEGER NOT NULL CHECK (required IN (0,1)),
      field_type  TEXT    NOT NULL,
      FOREIGN KEY(task_id) REFERENCES ${Tables.task}(id) ON DELETE CASCADE
    );
    ''');

    batch.execute('''
    CREATE TABLE ${Tables.taskInstance} (
      id          INTEGER PRIMARY KEY,
      task_id     INTEGER NOT NULL,
      user_id     INTEGER NOT NULL,
      task_status INTEGER NOT NULL,
      created_at  TEXT    DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY(task_id) REFERENCES ${Tables.task}(id) ON DELETE CASCADE
    );
    ''');

    batch.execute('''
    CREATE TABLE ${Tables.fieldResponse} (
      id                 INTEGER PRIMARY KEY,
      task_instance_id   INTEGER NOT NULL,
      field_id           INTEGER NOT NULL,
      value              TEXT,
      FOREIGN KEY(task_instance_id) REFERENCES ${Tables.taskInstance}(id) ON DELETE CASCADE,
      FOREIGN KEY(field_id)           REFERENCES ${Tables.field}(id)        ON DELETE CASCADE
    );
    ''');
  }
}
