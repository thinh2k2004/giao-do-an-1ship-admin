import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_web/presentation/route/app_route.dart';

final di = GetIt.asNewInstance()..allowReassignment = true;

@injectableInit
Future<void> initDI() async {
  di.registerSingleton<AppRouter>(AppRouter());
}

void resetDI() {
  di.reset();
}