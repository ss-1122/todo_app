import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'todos.dart'; // 上記テーブル定義ファイル（名前は自由）

part 'app_database.g.dart'; // 自動生成ファイル

@DriftDatabase(tables: [Todos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

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
