import 'package:get/get.dart';

import '../../../app/routes/app_route.dart';
import '../model/route_model.dart';
import '../repository/route_repository.dart';

class HomeController extends GetxController {
  HomeController({required this.repository});

  final RouteRepository repository;

  final isLoading = true.obs;
  final routes = <BusRoute>[].obs;
  final searchQuery = ''.obs;

  List<BusRoute> get filteredRoutes {
    final query = searchQuery.value.trim().toLowerCase();
    if (query.isEmpty) return routes;

    return routes.where((route) {
      return route.origin.toLowerCase().contains(query) ||
          route.destination.toLowerCase().contains(query);
    }).toList();
  }

  @override
  void onInit() {
    super.onInit();
    loadRoutes();
  }

  Future<void> loadRoutes() async {
    isLoading.value = true;
    try {
      routes.value = await repository.getRoutes();
    } finally {
      isLoading.value = false;
    }
  }

  void onSearchChanged(String value) {
    searchQuery.value = value;
  }

  void openRoute(BusRoute route) {
    Get.toNamed(Routes.bus, arguments: route);
  }
}
