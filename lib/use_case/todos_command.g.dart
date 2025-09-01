// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todosCommandHash() => r'46617a15de829f3a72018ac246fe7124aefafe5d';

/// TodosCommand のプロバイダー
///
/// CQRS設計に基づき、「書き込み操作（Command）」専用のクラスです。
/// UI/Notifierはこのクラスを通じてローカルDBに対して登録・更新・削除を行います。
///
/// Copied from [todosCommand].
@ProviderFor(todosCommand)
final todosCommandProvider = AutoDisposeProvider<TodosCommand>.internal(
  todosCommand,
  name: r'todosCommandProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todosCommandHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodosCommandRef = AutoDisposeProviderRef<TodosCommand>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
