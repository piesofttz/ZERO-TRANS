import '../model/route_model.dart';

/// TODO(backend): replace with a GET to ApiEndpoints.routes via
/// DioClient.dio once the backend exposes the routes endpoint. The mock
/// list below stands in until then.
class RouteRepository {
  Future<List<BusRoute>> getRoutes() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockRoutes;
  }

  static final List<BusRoute> _mockRoutes = [
    const BusRoute(
      id: 'r1',
      origin: 'Happy Nation',
      destination: 'Karama',
      distance: '42 km',
      duration: '1h 10m',
      baseFare: 3500,
      busCount: 4,
    ),
    const BusRoute(
      id: 'r2',
      origin: 'Nyeunge',
      destination: 'BM Terminal',
      distance: '28 km',
      duration: '45m',
      baseFare: 2200,
      busCount: 3,
    ),
    const BusRoute(
      id: 'r3',
      origin: 'Karama',
      destination: 'Allys',
      distance: '65 km',
      duration: '1h 40m',
      baseFare: 5000,
      busCount: 2,
    ),
    const BusRoute(
      id: 'r4',
      origin: 'Happy Nation',
      destination: 'Allys',
      distance: '90 km',
      duration: '2h 15m',
      baseFare: 7000,
      busCount: 5,
    ),
    const BusRoute(
      id: 'r5',
      origin: 'BM Terminal',
      destination: 'Nyeunge',
      distance: '28 km',
      duration: '45m',
      baseFare: 2200,
      busCount: 3,
    ),
  ];
}
