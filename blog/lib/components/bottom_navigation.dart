import 'package:blog/controller/dashboard_navigate.dart';
import 'package:blog/views/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarr extends StatelessWidget {
  final controller = Get.put(DashboardNavigate());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  controller.updateCurrentIndex(0);
                },
                icon: Obx(() => Icon(
                      Icons.home,
                      size: 35,
                      color: controller.currentIndex == 0
                          ? Colors.white
                          : Colors.white38,
                    ))),
            IconButton(
                onPressed: () {
                  controller.updateCurrentIndex(1);
                },
                icon: Obx(() => Icon(
                      Icons.person,
                      size: 35,
                      color: controller.currentIndex == 1
                          ? Colors.white
                          : Colors.white38,
                    )))
          ],
        ),
      ),
    );
  }
}
