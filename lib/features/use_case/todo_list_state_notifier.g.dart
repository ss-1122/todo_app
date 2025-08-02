// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoListStateNotifierHash() =>
    r'c94cfd0a1331be387b3f43a08c71aa8aef395e59';

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
///
/// Copied from [TodoListStateNotifier].
@ProviderFor(TodoListStateNotifier)
final todoListStateNotifierProvider =
    AutoDisposeNotifierProvider<TodoListStateNotifier, TodoListState>.internal(
      TodoListStateNotifier.new,
      name: r'todoListStateNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$todoListStateNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TodoListStateNotifier = AutoDisposeNotifier<TodoListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
