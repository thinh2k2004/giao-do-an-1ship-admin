import 'package:base_getx/external/pages/debug/debug_page.dart';
import 'package:base_getx/external/pages/home/home_page.dart';
import 'package:base_getx/presenters/bindings/debug/debug_binding.dart';
import 'package:base_getx/presenters/bindings/home/home_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.DEBUG,
      page: () => const DebugPage(),
      binding: DebugBinding(),
    ),
  ];
}
