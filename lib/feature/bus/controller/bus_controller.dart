import 'package:get/get.dart';

import '../../../app/routes/app_route.dart';
import '../../home/model/route_model.dart';
import '../model/bus_model.dart';
import '../repository/bus_repository.dart';

class BusController extends GetxController {
  BusController({required this.repository});

  final BusRepository repository;

  late final BusRoute route;

  final isLoading = true.obs;
  final buses = <Bus>[].obs;

  @override
  void onInit() {
    super.onInit();
    route = Get.arguments as BusRoute;
    loadBuses();
  }

  Future<void> loadBuses() async {
    isLoading.value = true;
    try {
      buses.value = await repository.getBusesForRoute(route.id, route.baseFare);
    } finally {
      isLoading.value = false;
    }
  }

  void openTicket(Bus bus) {
    Get.toNamed(Routes.ticket, arguments: {'route': route, 'bus': bus});
  }
}
