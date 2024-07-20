import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class BaseController<T> extends GetxController {
  T? arguments = Get.arguments == null ? null : Get.arguments as T;
  final _loadingStatus = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get loadingStatus => _loadingStatus.stream;

  void setLoading(bool value) {
    _loadingStatus.add(value);
  }

  @override
  void onClose() {
    _loadingStatus.close();
    super.onClose();
  }

  void onError(String statusCode, String message) {}
}
