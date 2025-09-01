// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Todo {

 int get rowId; bool get onCheck; String get contents;
/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoCopyWith<Todo> get copyWith => _$TodoCopyWithImpl<Todo>(this as Todo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Todo&&(identical(other.rowId, rowId) || other.rowId == rowId)&&(identical(other.onCheck, onCheck) || other.onCheck == onCheck)&&(identical(other.contents, contents) || other.contents == contents));
}


@override
int get hashCode => Object.hash(runtimeType,rowId,onCheck,contents);

@override
String toString() {
  return 'Todo(rowId: $rowId, onCheck: $onCheck, contents: $contents)';
}


}

/// @nodoc
abstract mixin class $TodoCopyWith<$Res>  {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) _then) = _$TodoCopyWithImpl;
@useResult
$Res call({
 int rowId, bool onCheck, String contents
});




}
/// @nodoc
class _$TodoCopyWithImpl<$Res>
    implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._self, this._then);

  final Todo _self;
  final $Res Function(Todo) _then;

/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rowId = null,Object? onCheck = null,Object? contents = null,}) {
  return _then(_self.copyWith(
rowId: null == rowId ? _self.rowId : rowId // ignore: cast_nullable_to_non_nullable
as int,onCheck: null == onCheck ? _self.onCheck : onCheck // ignore: cast_nullable_to_non_nullable
as bool,contents: null == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _Todo implements Todo {
  const _Todo({required this.rowId, required this.onCheck, required this.contents});
  

@override final  int rowId;
@override final  bool onCheck;
@override final  String contents;

/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoCopyWith<_Todo> get copyWith => __$TodoCopyWithImpl<_Todo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Todo&&(identical(other.rowId, rowId) || other.rowId == rowId)&&(identical(other.onCheck, onCheck) || other.onCheck == onCheck)&&(identical(other.contents, contents) || other.contents == contents));
}


@override
int get hashCode => Object.hash(runtimeType,rowId,onCheck,contents);

@override
String toString() {
  return 'Todo(rowId: $rowId, onCheck: $onCheck, contents: $contents)';
}


}

/// @nodoc
abstract mixin class _$TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$TodoCopyWith(_Todo value, $Res Function(_Todo) _then) = __$TodoCopyWithImpl;
@override @useResult
$Res call({
 int rowId, bool onCheck, String contents
});




}
/// @nodoc
class __$TodoCopyWithImpl<$Res>
    implements _$TodoCopyWith<$Res> {
  __$TodoCopyWithImpl(this._self, this._then);

  final _Todo _self;
  final $Res Function(_Todo) _then;

/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rowId = null,Object? onCheck = null,Object? contents = null,}) {
  return _then(_Todo(
rowId: null == rowId ? _self.rowId : rowId // ignore: cast_nullable_to_non_nullable
as int,onCheck: null == onCheck ? _self.onCheck : onCheck // ignore: cast_nullable_to_non_nullable
as bool,contents: null == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
