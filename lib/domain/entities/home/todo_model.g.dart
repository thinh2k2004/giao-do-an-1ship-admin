// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TodoModelCWProxy {
  TodoModel userId(int userId);

  TodoModel id(int id);

  TodoModel title(String title);

  TodoModel completed(bool completed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TodoModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TodoModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TodoModel call({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTodoModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTodoModel.copyWith.fieldName(...)`
class _$TodoModelCWProxyImpl implements _$TodoModelCWProxy {
  const _$TodoModelCWProxyImpl(this._value);

  final TodoModel _value;

  @override
  TodoModel userId(int userId) => this(userId: userId);

  @override
  TodoModel id(int id) => this(id: id);

  @override
  TodoModel title(String title) => this(title: title);

  @override
  TodoModel completed(bool completed) => this(completed: completed);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TodoModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TodoModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TodoModel call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? completed = const $CopyWithPlaceholder(),
  }) {
    return TodoModel(
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as int,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      completed: completed == const $CopyWithPlaceholder() || completed == null
          ? _value.completed
          // ignore: cast_nullable_to_non_nullable
          : completed as bool,
    );
  }
}

extension $TodoModelCopyWith on TodoModel {
  /// Returns a callable class that can be used as follows: `instanceOfTodoModel.copyWith(...)` or like so:`instanceOfTodoModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TodoModelCWProxy get copyWith => _$TodoModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      userId: json['userId'] as int? ?? -1,
      id: json['id'] as int? ?? -1,
      title: json['title'] as String? ?? '',
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
