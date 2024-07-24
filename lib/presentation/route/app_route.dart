import 'package:auto_route/auto_route.dart';
import 'package:test_web/presentation/route/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: LoginRoute.page, initial: true, path: '/login'),
        AutoRoute(page: HomeRoute.page, path: '/home'),
      ];
}
