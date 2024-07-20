import 'package:base_getx/domain/entities/home/photo_model.dart';
import 'package:base_getx/domain/entities/home/todo_model.dart';

abstract class IHomeRepository {
  Future<TodoModel> getTodos();
  Future<List<PhotoModel>> getPhotos();
}
