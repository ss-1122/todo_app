// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_query.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todosQueryHash() => r'6e43a2e42d0f24c8e46a4bd37ec874b872d12496';

/// Todo一覧を取得するクエリプロバイダ。
///
/// Driftのレコード（TodosTableData）を
/// アプリ用のTodoクラスに変換して返します。
///
/// Copied from [todosQuery].
@ProviderFor(todosQuery)
final todosQueryProvider = AutoDisposeFutureProvider<List<Todo>>.internal(
  todosQuery,
  name: r'todosQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todosQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodosQueryRef = AutoDisposeFutureProviderRef<List<Todo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
