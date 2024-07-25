import 'package:flutter/material.dart';
import 'package:test_web/di/di.dart';
import 'package:test_web/presentation/route/app_route.dart';

void main() async {
  await initDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = di<AppRouter>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sidebar Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
