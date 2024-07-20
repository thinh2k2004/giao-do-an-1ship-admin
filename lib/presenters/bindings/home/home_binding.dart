import 'package:base_getx/presenters/controllers/home/home_controller.dart';
import 'package:base_getx/presenters/repositories/home/home_repository.dart';
import 'package:base_getx/domain/repositories/home/i_home_repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IHomeRepository>(() => HomeRepository(apiClient: Get.find()))
      ..lazyPut(() => HomeController(homeRepository: Get.find()));
  }
}
