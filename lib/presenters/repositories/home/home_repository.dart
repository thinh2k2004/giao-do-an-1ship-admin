// import 'dart:isolate';

import 'package:base_getx/domain/entities/base/base_response.dart';
import 'package:base_getx/domain/entities/home/photo_model.dart';
import 'package:base_getx/domain/entities/home/todo_model.dart';
import 'package:base_getx/domain/repositories/home/i_home_repository.dart';
import 'package:base_getx/presenters/shared/api_client/api_client.dart';
import 'package:base_getx/presenters/shared/api_client/api_end_point.dart';
// import 'package:flutter/foundation.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<TodoModel> getTodos() async {
    final response = await apiClient.get(ApiEndPoint.todos);
    return TodoModel.fromJson(response.data);
  }

  @override
  Future<List<PhotoModel>> getPhotos() async {
    final response = await apiClient.get(ApiEndPoint.photos);
    // final baseResponse = toBaseResponse(response.data);
    // return fromJsonList<PhotoModel>(baseResponse, PhotoModel.fromJson);
    return fromJsonList<PhotoModel>(response.data, PhotoModel.fromJson);
  }

  // @override
  // Future<List<PhotoModel>> getPhotos() async {
  //   final response = await apiClient.get(ApiEndPoint.photos);
  //   // return compute(parsePhotos, response.data);
  // return Isolate.run(() => parsePhotos(response.data));
  //   return compute((data) => parsePhotos(data), response.data);
  // }

  // @override
  // Future<List<PhotoModel>> getPhotos() async {
  //   final response = await apiClient.get(ApiEndPoint.photos);
  //
  //   final port = ReceivePort();
  //   final isolate = await Isolate.spawn(
  //     (param) => parsePhotosSpawn(param),
  //     [port.sendPort, response.data],
  //   );
  //   final data = await port.first;
  //   port.close();
  //   isolate.kill(priority: Isolate.immediate);
  //
  //   return data;
  // }
}

// List<PhotoModel> parsePhotos(dynamic data) {
//   return fromJsonList<PhotoModel>(data, PhotoModel.fromJson);
// }

// void parsePhotosSpawn(List<dynamic> param) {
//   final SendPort sendPort = param[0];
//   final parsed = fromJsonList<PhotoModel>(param[1], PhotoModel.fromJson);
//   sendPort.send(parsed);
// }
