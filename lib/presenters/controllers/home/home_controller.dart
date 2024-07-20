import 'package:base_getx/domain/utils/app_log.dart';
import 'package:base_getx/presenters/controllers/base/base_controller.dart';
import 'package:base_getx/domain/entities/home/photo_model.dart';
import 'package:base_getx/domain/entities/home/todo_model.dart';
import 'package:base_getx/domain/repositories/home/i_home_repository.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  HomeController({required this.homeRepository});

  final IHomeRepository homeRepository;

  final todoTask = Rx<TodoModel>(TodoModel());

  final photo = Rx<PhotoModel>(PhotoModel());

  @override
  Future<void> onReady() async {
    super.onReady();
    // final name = FirebaseRemoteConfigService.getConfigName();
    // print('kkk');
    // print(name);
    _init();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> _init() async {
    setLoading(true);
    await Future.wait([
      _getTodos(),
      _getPhotos(),
    ]);
    setLoading(false);
  }

  Future<void> _getTodos() async {
    try {
      final data = await homeRepository.getTodos();
      // todoTask(data);
      todoTask.value = data;
    } catch (e, trace) {
      AppLog.error(e.toString(), e, trace);
    }
  }

  Future<void> _getPhotos() async {
    try {
      final data = await homeRepository.getPhotos();
      photo.value = data[0];
    } catch (e, trace) {
      AppLog.error(e.toString(), e, trace);
    }
  }
}
