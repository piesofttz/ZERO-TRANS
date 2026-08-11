import 'package:get/get.dart';

import '../../../core/services/storage_service.dart';

class ProfileController extends GetxController {
  String get agentName => StorageService.getAgentName();
  String get agentEmail => StorageService.getAgentEmail();
}
