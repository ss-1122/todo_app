import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/features/model/todo.dart';

part 'todo_list_state.freezed.dart';

/// TodoListの状態クラス
/// - [todos]: Todoリスト
@freezed
sealed class TodoListState with _$TodoListState {
  const factory TodoListState({required List<Todo> todos}) = _TodoListState;
}
