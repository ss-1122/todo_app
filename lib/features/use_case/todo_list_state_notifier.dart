import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/features/model/todo.dart';
import 'package:todo_app/features/model/todo_list_state.dart';

part 'todo_list_state_notifier.g.dart';

/// Todoリストの状態を管理する Notifier クラス。
///
/// - Todo の追加
/// - チェック状態のトグル
/// - Todo の削除
///
/// を提供します。
///
/// 状態は [TodoListState] として保持され、
/// UI 側ではこの Notifier を通じて状態を読み書きします。
@riverpod
class TodoListStateNotifier extends _$TodoListStateNotifier {
  @override
  TodoListState build() {
    // 初期状態：空のTodoリスト
    return const TodoListState(todos: []);
  }

  // Todoを追加する
  void add(String contents) {
    state = state.copyWith(
      todos: [
        ...state.todos,
        Todo(onCheck: false, contents: contents),
      ],
    );
  }

  // チェック状態をトグルする
  void toggle(int index) {
    final updated = [...state.todos];
    final target = updated[index];
    updated[index] = target.copyWith(onCheck: !target.onCheck);

    state = state.copyWith(todos: updated);
  }

  // Todoをすべて削除する
  void clear() {
    state = state.copyWith(todos: []);
  }
}
