// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoListStateNotifierHash() =>
    r'20df4c2e82cfda41bf37097254dd535443ea3a2d';

/// Todoリストの状態を管理する AsyncNotifier クラス。
///
/// Copied from [TodoListStateNotifier].
@ProviderFor(TodoListStateNotifier)
final todoListStateNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      TodoListStateNotifier,
      TodoListState
    >.internal(
      TodoListStateNotifier.new,
      name: r'todoListStateNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$todoListStateNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TodoListStateNotifier = AutoDisposeAsyncNotifier<TodoListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
