import 'package:blog/components/app_bar.dart';
import 'package:blog/components/bottom_navigation.dart';
import 'package:blog/components/drawer_widget.dart';
import 'package:blog/controller/dashboard_navigate.dart';
import 'package:blog/views/HomePage.dart';
import 'package:blog/views/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final controller = Get.put(DashboardNavigate());
  var pages = [HomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
          child: Drawer(
        child: DrawerWidget(),
      )),
      appBar: appBar("Homae Page", Icons.notifications),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Obx(() => pages[controller.currentIndex.toInt()]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: BottomNavigationBarr(),
      ),
    );
  }
}
