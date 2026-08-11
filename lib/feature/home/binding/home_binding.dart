import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../repository/route_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RouteRepository>(() => RouteRepository());

    Get.lazyPut<HomeController>(
      () => HomeController(repository: Get.find<RouteRepository>()),
    );
  }
}
