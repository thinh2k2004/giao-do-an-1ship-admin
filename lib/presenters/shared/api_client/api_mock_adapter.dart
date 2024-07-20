import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class APIMockingAdapter extends IOHttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    switch (options.path) {
      // case ApiEndPoint.todos:
      //   return _createCartResponse();
    }
    return super.fetch(options, requestStream, cancelFuture);
  }

  // ignore: unused_element
  Future<ResponseBody> _createCartResponse() async => ResponseBody.fromString(
      '''{
      "userId": 1,
      "id": 1,
      "title": "delectus aut autem test",
      "completed": false
      }
      ''',
      200,
      headers: {
        'content-type': ['application/json']
      });
}
