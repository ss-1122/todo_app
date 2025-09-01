import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

/// Todoクラス
///
/// - [onCheck]: チェックの有無
/// - [contents]: Todoの内容
@freezed
sealed class Todo with _$Todo {
  const factory Todo({
    required int rowId,
    required bool onCheck,
    required String contents,
  }) = _Todo;
}
