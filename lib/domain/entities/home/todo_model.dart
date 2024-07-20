import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@CopyWith()
@JsonSerializable()
// @JsonSerializable(fieldRename: FieldRename.snake)
class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoModel({
    this.userId = -1,
    this.id = -1,
    this.title = '',
    this.completed = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
