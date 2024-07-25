import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Color(0xFF2C3E50),
      child: ListView(
        children: <Widget>[
          Container(
            height: 100,
            color: Color(0xFF34495E),
            child: Center(
              child: Text(
                'ONESHIP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text('Dashboard', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ExpansionTile(
            leading: Icon(Icons.store, color: Colors.white),
            title:
                Text('Quản lý cửa hàng', style: TextStyle(color: Colors.white)),
            children: <Widget>[
              ListTile(
                title: Text('Thông tin chủ cửa hàng',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  html.window.history
                      .pushState(null, 'showOwnerInfo', '#/home/showOwnerInfo');
                  
                },
              ),
              ListTile(
                title: Text('Danh sách cửa hàng',
                    style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                title: Text('Quản lý Product',
                    style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                title: Text('Báo cáo đơn hàng hủy',
                    style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                title: Text('Đánh giá khách hàng',
                    style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.directions_car, color: Colors.white),
            title:
                Text('Quản lý Drivers', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.receipt, color: Colors.white),
            title:
                Text('Quản lý Đơn hàng', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.attach_money, color: Colors.white),
            title: Text('Quản lý phí vận chuyển',
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.local_offer, color: Colors.white),
            title: Text('Quản lý khuyến mãi',
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.photo, color: Colors.white),
            title:
                Text('Quản lý Banner', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.white),
            title: Text('Quản lý Khách hàng',
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.assessment, color: Colors.white),
            title: Text('Báo cáo', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings, color: Colors.white),
            title: Text('Admin', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Cấu hình', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.task, color: Colors.white),
            title: Text('Công việc cần xử lý',
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
