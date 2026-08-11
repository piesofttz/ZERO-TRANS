import 'package:get/get.dart';

import '../../repository/login_repository.dart';
import '../controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepository>(() => LoginRepository());

    Get.lazyPut<LoginController>(
      () => LoginController(repository: Get.find<LoginRepository>()),
    );
  }
}
