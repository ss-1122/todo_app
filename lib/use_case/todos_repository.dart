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
  Future<List<TodosTableData>> getAll() {
    return db.select(db.todosTable).get();
  }

  /// 全てのレコードを削除する
  Future<void> deleteAll() async {
    await db.delete(db.todosTable).go();
  }

  /// 1件レコードを登録してrowIdを返却する
  Future<int> insert(String contents) {
    return db
        .into(db.todosTable)
        .insert(
          TodosTableCompanion(contents: Value(contents), done: Value(false)),
        );
  }

  Future<void> update({
    required int rowId,
    String? contents,
    bool? done,
  }) async {
    db.update(db.todosTable)
      ..where((tbl) => tbl.rowId.equals(rowId))
      ..write(
        TodosTableCompanion(
          contents: contents != null ? Value(contents) : const Value.absent(),
          done: done != null ? Value(done) : const Value.absent(),
        ),
      );
  }
}
