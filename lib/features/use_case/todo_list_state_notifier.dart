import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/features/model/todo.dart';
import 'package:todo_app/features/model/todo_list_state.dart';
import 'package:todo_app/features/use_case/todos_command.dart';
import 'package:todo_app/features/use_case/todos_query.dart';

part 'todo_list_state_notifier.g.dart';

/// Todoリストの状態を管理する AsyncNotifier クラス。
@riverpod
class TodoListStateNotifier extends _$TodoListStateNotifier {
  @override
  Future<TodoListState> build() async {
    final todos = await ref.watch(todosQueryProvider.future);
    return TodoListState(todos: todos);
  }

  /// Todoを追加する
  Future<void> add(String contents) async {
    // ローカルDBにレコードを追加し、rowIdを受け取る
    final rowId = await ref.read(todosCommandProvider).insert(contents);

    final todos = state.requireValue.todos;
    state = AsyncValue.data(
      TodoListState(
        todos: [
          ...todos,
          Todo(rowId: rowId, onCheck: false, contents: contents),
        ],
      ),
    );
  }

  /// チェック状態をトグルする
  Future<void> toggle(int index) async {
    final todos = state.requireValue.todos;
    final updated = [...todos];
    final target = updated[index];

    final toggled = !target.onCheck;
    updated[index] = target.copyWith(onCheck: toggled);

    // ローカルDBのレコードを更新
    ref.read(todosCommandProvider).toggle(rowId: target.rowId, done: toggled);
    state = AsyncValue.data(TodoListState(todos: updated));
  }

  /// Todoをすべて削除する
  Future<void> clear() async {
    // ローカルDBのレコードを全削除する
    ref.read(todosCommandProvider).deleteAll();
    state = AsyncValue.data(const TodoListState(todos: []));
  }
}
