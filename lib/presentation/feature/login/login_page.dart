import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_web/definations/enum/page_type.dart';
import 'package:test_web/presentation/route/app_route.gr.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              context.pushRoute(HomeRoute(pageType: PageType.dashboard));
            },
            child: Text('Login Page')),
      ),
    );
  }
}
