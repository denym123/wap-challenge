import 'migrations/migrations.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [MigrationV1()];

  List<Migration> getUpgradeMigration(int version) {
    final migrations = <Migration>[];
    migrations.add(MigrationV1());

    return migrations;
  }
}
