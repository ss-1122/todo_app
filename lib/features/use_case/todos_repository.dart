import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/data/local/database.dart';
import 'package:todo_app/data/local/database_provider.dart';

part 'todos_repository.g.dart';

@riverpod
TodosRepository todosRepository(Ref ref) {
  final db = ref.watch(databaseProvider);
  return TodosRepository(db: db);
}

class TodosRepository {
  TodosRepository({required this.db});

  final Database db;

  /// 全てのレコードを取得する
  Future<List<TodosTableData>> getAll() async {
    return db.select(db.todosTable).get();
  }

  /// 全てのレコードを削除する
  Future<void> deleteAll() async {
    await db.delete(db.todosTable).go();
  }

  Future<void> insert({required TodosTableData entry}) async {
    await db
        .into(db.todosTable)
        .insert(
          TodosTableCompanion(
            contents: Value(entry.contents),
            done: Value(entry.done),
          ),
        );
  }

  Future<void> update({required TodosTableData entry}) async {
    await (db.update(
      db.todosTable,
    )..where((t) => t.rowId.equals(entry.rowId))).write(
      TodosTableCompanion(
        contents: Value(entry.contents),
        done: Value(entry.done),
      ),
    );
  }
}
