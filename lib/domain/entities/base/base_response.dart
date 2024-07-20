class BaseResponse {
  BaseResponse({
    required this.id,
    required this.status,
    required this.message,
    required this.totalRow,
    required this.data,
  });

  final int id;
  final int status;
  final String message;
  final int totalRow;
  final dynamic data;

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        id: json['id'] ?? 0,
        status: json['status'] ?? 0,
        message: json['message'] ?? '',
        totalRow: json['totalRow'] ?? 0,
        data: json['data'],
      );
}

dynamic toBaseResponse(Map<String, dynamic> json) {
  final response = BaseResponse.fromJson(json);
  if (response.status != 200) {
    // DialogUtil.notifyDialog(content: response.message);
    throw Exception(response.message);
  }
  return response.data;
}

List<T> fromJsonList<T>(
    List<dynamic>? jsonList, T Function(Map<String, dynamic> json) fromJson) {
  return jsonList?.map((e) => fromJson(e)).toList() ?? [];
}
