import 'package:get/get.dart';

import '../../home/binding/home_binding.dart';
import '../../profile/binding/profile_binding.dart';
import '../../setting/binding/setting_binding.dart';
import '../controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());

    HomeBinding().dependencies();
    ProfileBinding().dependencies();
    SettingBinding().dependencies();
  }
}
