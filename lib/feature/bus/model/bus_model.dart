class Bus {
  final String id;
  final String routeId;
  final String plateNumber;
  final String operatorName;
  final String busType;
  final String departureTime;
  final String arrivalTime;
  final int availableSeats;
  final int totalSeats;
  final double fare;

  const Bus({
    required this.id,
    required this.routeId,
    required this.plateNumber,
    required this.operatorName,
    required this.busType,
    required this.departureTime,
    required this.arrivalTime,
    required this.availableSeats,
    required this.totalSeats,
    required this.fare,
  });
}
