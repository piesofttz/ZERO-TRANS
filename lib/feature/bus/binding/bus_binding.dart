import 'package:get/get.dart';

import '../controller/bus_controller.dart';
import '../repository/bus_repository.dart';

class BusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusRepository>(() => BusRepository());

    Get.lazyPut<BusController>(
      () => BusController(repository: Get.find<BusRepository>()),
    );
  }
}
