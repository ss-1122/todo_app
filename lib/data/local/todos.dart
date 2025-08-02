import 'package:drift/drift.dart';

/// Todosテーブル定義クラス。
class Todos extends Table {
  /// 行ID。
  IntColumn get rowId => integer().autoIncrement()();

  /// Todoの内容。
  TextColumn get contents => text()();

  /// Todoが完了したかどうか。
  BoolColumn get done => boolean().withDefault(const Constant(false))();
}
