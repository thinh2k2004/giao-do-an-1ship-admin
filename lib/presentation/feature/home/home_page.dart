import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sidebar Menu Example'),
      ),
      drawer: Drawer(
        child: SidebarMenu(),
      ),
      body: Center(
        child: Text('Content goes here'),
      ),
    );
  }
}

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://example.com/logo.png',
                height: 50,
              ),
              SizedBox(height: 10),
              Text(
                'ONESHIP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.dashboard),
          title: Text('Dashboard'),
          onTap: () {
            
          },
        ),
        ExpansionTile(
          leading: Icon(Icons.store),
          title: Text('Quản lý cửa hàng'),
          children: <Widget>[
            ListTile(
              title: Text('Thông tin chủ cửa hàng'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Danh sách cửa hàng'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Quản lý Product'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Báo cáo đơn hàng hủy'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Đánh giá khách hàng'),
              onTap: () {},
            ),
          ],
        ),
        ListTile(
          leading: Icon(Icons.local_shipping),
          title: Text('Quản lý Drivers'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text('Quản lý Đơn hàng'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.attach_money),
          title: Text('Quản lý phí vận chuyển'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.local_offer),
          title: Text('Quản lý khuyến mãi'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.image),
          title: Text('Quản lý Banner'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('Quản lý Khách hàng'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.bar_chart),
          title: Text('Báo cáo'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.admin_panel_settings),
          title: Text('Admin'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Cấu hình'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.work),
          title: Text('Công việc cần xử lý'),
          onTap: () {},
        ),
      ],
    );
  }
}
