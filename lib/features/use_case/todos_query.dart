import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/features/model/todo.dart';
import 'package:todo_app/features/use_case/todos_repository.dart';

part 'todos_query.g.dart';

/// Todo一覧を取得するクエリプロバイダ。
///
/// Driftのレコード（TodosTableData）を
/// アプリ用のTodoクラスに変換して返します。
@riverpod
Future<List<Todo>> todosQuery(Ref ref) async {
  final repository = ref.watch(todosRepositoryProvider);
  final records = await repository.getAll();

  // Driftのレコード -> アプリのTodoに変換
  return records.map((record) {
    return Todo(
      rowId: record.rowId,
      onCheck: record.done,
      contents: record.contents,
    );
  }).toList();
}
