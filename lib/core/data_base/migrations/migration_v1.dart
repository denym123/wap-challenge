import 'package:sqflite_common/sqlite_api.dart';

import 'migrations.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
-- Usuários do sistema
    CREATE TABLE User (
    id       INTEGER PRIMARY KEY,     -- AUTOINCREMENT implícito
    username TEXT    NOT NULL UNIQUE,
    email    TEXT    UNIQUE
  );
''');

    batch.execute('''
-- Tarefas do sistema
    CREATE TABLE Task (
      id          INTEGER PRIMARY KEY,
      user_id     INTEGER NOT NULL,
      task_name   TEXT    NOT NULL,
      description TEXT,
      FOREIGN KEY(user_id) REFERENCES User(id) ON DELETE CASCADE
  );
''');

    batch.execute('''
-- Campos de cada tarefa
    CREATE TABLE Field (
      id          INTEGER PRIMARY KEY,
      task_id     INTEGER NOT NULL,
      label       TEXT    NOT NULL,
      required    INTEGER NOT NULL CHECK (required IN (0,1)),
      field_type  TEXT    NOT NULL,
      FOREIGN KEY(task_id) REFERENCES Task(id) ON DELETE CASCADE
    );
''');

    batch.execute('''
-- Cada vez que um usuário executa uma Task, geramos uma instância
    CREATE TABLE TaskInstance (
      id          INTEGER PRIMARY KEY,
      task_id     INTEGER NOT NULL,
      created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY(task_id) REFERENCES Task(id) ON DELETE CASCADE
    );
''');

    batch.execute('''
-- Respostas para cada campo naquela instância
    CREATE TABLE FieldResponse (
      id                 INTEGER PRIMARY KEY,
      task_instance_id   INTEGER NOT NULL,
      field_id           INTEGER NOT NULL,
      value              TEXT,
      FOREIGN KEY(task_instance_id) REFERENCES TaskInstance(id) ON DELETE CASCADE,
      FOREIGN KEY(field_id)           REFERENCES Field(id)        ON DELETE CASCADE
    );
''');
  }

  @override
  void update(Batch batch) {
    batch.execute('''
-- Usuários do sistema
    CREATE TABLE User (
    id       INTEGER PRIMARY KEY,     -- AUTOINCREMENT implícito
    username TEXT    NOT NULL UNIQUE,
    email    TEXT    UNIQUE
  );
''');

    batch.execute('''
-- Tarefas do sistema
    CREATE TABLE Task (
      id          INTEGER PRIMARY KEY,
      user_id     INTEGER NOT NULL,
      task_name   TEXT    NOT NULL,
      description TEXT,
      FOREIGN KEY(user_id) REFERENCES User(id) ON DELETE CASCADE
  );
''');

    batch.execute('''
-- Campos de cada tarefa
    CREATE TABLE Field (
      id          INTEGER PRIMARY KEY,
      task_id     INTEGER NOT NULL,
      label       TEXT    NOT NULL,
      required    INTEGER NOT NULL CHECK (required IN (0,1)),
      field_type  TEXT    NOT NULL,
      FOREIGN KEY(task_id) REFERENCES Task(id) ON DELETE CASCADE
    );
''');

    batch.execute('''
-- Cada vez que um usuário executa uma Task, geramos uma instância
    CREATE TABLE TaskInstance (
      id          INTEGER PRIMARY KEY,
      task_id     INTEGER NOT NULL,
      created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY(task_id) REFERENCES Task(id) ON DELETE CASCADE
    );
''');

    batch.execute('''
-- Respostas para cada campo naquela instância
    CREATE TABLE FieldResponse (
      id                 INTEGER PRIMARY KEY,
      task_instance_id   INTEGER NOT NULL,
      field_id           INTEGER NOT NULL,
      value              TEXT,
      FOREIGN KEY(task_instance_id) REFERENCES TaskInstance(id) ON DELETE CASCADE,
      FOREIGN KEY(field_id)           REFERENCES Field(id)        ON DELETE CASCADE
    );
''');
  }
}
