import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/use_case/todos_repository.dart';

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
  Future<int> insert(String contents) async {
    return await _repository.insert(contents);
  }

  /// チェック状態を更新する
  Future<void> toggle({required int rowId, required bool done}) async {
    await _repository.update(rowId: rowId, done: done);
  }
}
