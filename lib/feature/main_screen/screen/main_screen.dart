import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/widget/bottom_nav_bar.dart';
import '../../home/screen/home_screen.dart';
import '../../profile/screen/profile_screen.dart';
import '../../setting/screen/setting_screen.dart';
import '../controller/main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const pages = [
      HomeScreen(),
      ProfileScreen(),
      SettingScreen(),
    ];

    return Scaffold(
      body: Obx(() => IndexedStack(index: controller.currentIndex.value, children: pages)),
      bottomNavigationBar: Obx(
        () => BottomNavBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
