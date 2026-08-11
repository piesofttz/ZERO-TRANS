import '../model/bus_model.dart';

/// TODO(backend): replace with a GET to ApiEndpoints.busesForRoute(routeId)
/// via DioClient.dio once the backend exposes it. For now every route is
/// given a deterministic mock fleet so the UI can be built and demoed.
class BusRepository {
  Future<List<Bus>> getBusesForRoute(String routeId, double baseFare) async {
    await Future.delayed(const Duration(milliseconds: 500));

    const operators = ['Zero Trans Coach', 'Skyline Motors', 'Metro Link', 'CityLine Express'];
    const types = ['AC Seater', 'Non-AC Seater', 'VIP Sleeper'];
    const departures = ['06:00 AM', '08:30 AM', '11:00 AM', '02:15 PM', '05:45 PM'];

    return List.generate(3 + routeId.hashCode % 3, (index) {
      final seatTotal = 40 + (index * 4 % 12);
      return Bus(
        id: '$routeId-bus-$index',
        routeId: routeId,
        plateNumber: 'ZT-${1000 + routeId.hashCode.abs() % 900 + index}',
        operatorName: operators[index % operators.length],
        busType: types[index % types.length],
        departureTime: departures[index % departures.length],
        arrivalTime: departures[(index + 2) % departures.length],
        availableSeats: (seatTotal - (index * 7 % seatTotal)).clamp(0, seatTotal),
        totalSeats: seatTotal,
        fare: baseFare + (index * 250),
      );
    });
  }
}
