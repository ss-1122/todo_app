import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/data/local/database.dart';
import 'package:todo_app/features/use_case/todos_repository.dart';

part 'todos_query.g.dart';

/// Todo一覧を取得するクエリプロバイダ。
@riverpod
Future<List<TodosTableData>> todosQuery(Ref ref) {
  final repository = ref.watch(todosRepositoryProvider);
  return repository.getAll();
}
