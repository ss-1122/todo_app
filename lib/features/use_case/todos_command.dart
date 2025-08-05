import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/data/local/database.dart';
import 'package:todo_app/features/use_case/todos_repository.dart';

part 'todos_command.g.dart';

/// TodosCommand のプロバイダー
///
/// CQRS設計に基づき、「書き込み操作（Command）」専用のクラスです。
/// UI/Notifierはこのクラスを通じてローカルDBに対して登録・更新・削除を行います。
@riverpod
TodosCommand todosCommand(Ref ref) {
  final repository = ref.watch(todosRepositoryProvider);
  return TodosCommand(repository);
}

class TodosCommand {
  TodosCommand(this._repository);

  final TodosRepository _repository;

  /// 全てのTodoを削除する
  Future<void> deleteAll() async {
    await _repository.deleteAll();
  }

  /// Todoを1件追加する
  Future<void> insert(TodosTableData entry) async {
    await _repository.insert(entry: entry);
  }

  /// Todoを更新する
  Future<void> update(TodosTableData entry) async {
    await _repository.update(entry: entry);
  }
}
