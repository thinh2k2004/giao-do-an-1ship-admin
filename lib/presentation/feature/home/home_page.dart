import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_web/definations/enum/page_type.dart';
import 'package:test_web/presentation/feature/shop_owner_info/shop_owner_info_page.dart';
import 'package:test_web/presentation/feature/widget/app_bar_widget.dart';
import 'package:test_web/presentation/feature/widget/side_bar_menu.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({required this.pageType, super.key});
  final PageType pageType;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Test'),
      // ),
      // drawer: Drawer(
      //   child: SidebarMenu(),
      // ),
      body: Row(
        children: [
          Container(
            width: 368,
            height: double.infinity,
            color: Colors.blue,
            child: const SidebarMenu(),
          ),
          Expanded(
              child: Column(
            children: [
              const AppBarWidget(),
              _mainWidget(),
            ],
          )),
        ],
      ),
    );
  }

  Widget _mainWidget() {
    switch (widget.pageType) {
      case PageType.dashboard:
        return const SizedBox.shrink();
      case PageType.shopOwnerInfo:
        return const ShopOwnerInfoPage();
      case PageType.shops:
        return const SizedBox.shrink();
      case PageType.productManagement:
        return const SizedBox.shrink();
      case PageType.cancelOrderReport:
        return const SizedBox.shrink();
      case PageType.customerReviews:
        return const SizedBox.shrink();
      default:
        return const SizedBox.shrink();
    }
  }
}
