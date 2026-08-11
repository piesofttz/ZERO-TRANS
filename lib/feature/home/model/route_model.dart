class BusRoute {
  final String id;
  final String origin;
  final String destination;
  final String distance;
  final String duration;
  final double baseFare;
  final int busCount;

  const BusRoute({
    required this.id,
    required this.origin,
    required this.destination,
    required this.distance,
    required this.duration,
    required this.baseFare,
    required this.busCount,
  });

  String get title => "$origin → $destination";
}
