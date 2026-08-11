import 'package:get/get.dart';

import '../../../core/network/api_exceptions.dart';
import '../../../core/services/notification_service.dart';
import '../../bus/model/bus_model.dart';
import '../../home/model/route_model.dart';

class TicketController extends GetxController {
  late final BusRoute route;
  late final Bus bus;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    route = args['route'] as BusRoute;
    bus = args['bus'] as Bus;
  }

  /// TODO(backend): call ApiEndpoints.bookTicket via DioClient.dio once the
  /// booking endpoint exists. Until then we surface a clear "not ready yet"
  /// notice instead of pretending the booking succeeded.
  void bookTicket() {
    const error = BackendUnavailableException(
      'Ticket booking will be enabled once the backend is connected.',
    );
    NotificationService.info(title: error.title, message: error.message);
  }
}
