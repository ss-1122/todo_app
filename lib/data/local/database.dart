import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/data/local/todos_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TodosTable])
class Database extends _$Database {
  Database() : super(_openConnection());

  // DBのスキーマバージョン。変更時は上げる
  @override
  int get schemaVersion => 1;
}

// データベース接続先を作成
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'todo.sqlite'));
    return NativeDatabase(file);
  });
}
