import 'package:get/get.dart';

import '../../../app/routes/app_route.dart';
import '../../../core/services/storage_service.dart';

class SettingController extends GetxController {
  static const appVersion = '1.0.0';

  Future<void> logout() async {
    await StorageService.clearSession();
    Get.offAllNamed(Routes.login);
  }
}
