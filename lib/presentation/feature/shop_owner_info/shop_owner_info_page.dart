import 'package:flutter/material.dart';

class ShopOwnerInfoPage extends StatefulWidget {
  const ShopOwnerInfoPage({super.key});

  @override
  State<ShopOwnerInfoPage> createState() => _ShopOwnerInfoPageState();
}

class _ShopOwnerInfoPageState extends State<ShopOwnerInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Quản lý tài khoản Merchants'),
            const Spacer(),
            Text('Quản lý Merchants > Quản lý tài khoản Merchants'),
          ],
        ),
      ],
    );
  }
}
