class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? avatarUrl;
  final double rating;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.avatarUrl,
    this.rating = 4.8,
  });

  factory UserModel.dummy() => const UserModel(
    id: '1',
    name: 'John Doe',
    email: 'john.doe@email.com',
    phone: '+1 234 567 8900',
    avatarUrl: null,
    rating: 4.8,
  );
}

class TransportCategory {
  final String id;
  final String name;
  final String icon;
  final double priceMultiplier;
  final bool isSelected;

  const TransportCategory({
    required this.id,
    required this.name,
    required this.icon,
    this.priceMultiplier = 1.0,
    this.isSelected = false,
  });

  TransportCategory copyWith({bool? isSelected, double? priceMultiplier}) {
    return TransportCategory(
      id: id,
      name: name,
      icon: icon,
      priceMultiplier: priceMultiplier ?? this.priceMultiplier,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  static List<TransportCategory> get defaults => [
    const TransportCategory(id: '1', name: 'Taxi', icon: 'taxi', priceMultiplier: 1.2),
    const TransportCategory(id: '2', name: 'Bike', icon: 'bike', priceMultiplier: 0.6),
    const TransportCategory(id: '3', name: 'Bus', icon: 'bus', priceMultiplier: 0.4),
    const TransportCategory(id: '4', name: 'Auto', icon: 'auto', priceMultiplier: 0.8),
    const TransportCategory(id: '5', name: 'Train', icon: 'train', priceMultiplier: 0.5),
    const TransportCategory(id: '6', name: 'Rental Car', icon: 'car', priceMultiplier: 2.0),
    const TransportCategory(id: '7', name: 'Airport Ride', icon: 'airport', priceMultiplier: 2.5),
  ];
}

class Location {
  final String id;
  final String name;
  final String address;
  final double? latitude;
  final double? longitude;
  final String? icon;

  const Location({
    required this.id,
    required this.name,
    required this.address,
    this.latitude,
    this.longitude,
    this.icon,
  });

  static List<Location> get popularDestinations => [
    const Location(id: '1', name: 'Happy Nation', address: 'Happy Nation Bus Terminal', icon: 'bus'),
    const Location(id: '2', name: 'Nyeunge', address: 'Nyeunge Bus Stop', icon: 'bus'),
    const Location(id: '3', name: 'Karama', address: 'Karama Bus Terminal', icon: 'bus'),
    const Location(id: '4', name: 'BM COACH', address: 'BM COACH Station', icon: 'bus'),
    const Location(id: '5', name: 'ALLYS', address: 'ALLYS Bus Terminal', icon: 'bus'),
  ];
}

class Booking {
  final String id;
  final String driverName;
  final String? driverAvatar;
  final String vehicleType;
  final String vehicleImage;
  final String pickupTime;
  final String pickupLocation;
  final String destination;
  final String status;
  final double estimatedFare;
  final String estimatedTime;
  final String distance;
  final double? driverRating;

  const Booking({
    required this.id,
    required this.driverName,
    this.driverAvatar,
    required this.vehicleType,
    required this.vehicleImage,
    required this.pickupTime,
    required this.pickupLocation,
    required this.destination,
    required this.status,
    required this.estimatedFare,
    required this.estimatedTime,
    required this.distance,
    this.driverRating,
  });

  static List<Booking> get dummyBookings => [
    const Booking(
      id: '1',
      driverName: 'Mike Johnson',
      vehicleType: 'Premium Sedan',
      vehicleImage: 'sedan',
      pickupTime: '10:30 AM',
      pickupLocation: '123 Main Street',
      destination: 'International Airport',
      status: 'upcoming',
      estimatedFare: 45500,
      estimatedTime: '25 min',
      distance: '18.5 km',
      driverRating: 4.9,
    ),
    const Booking(
      id: '2',
      driverName: 'Sarah Williams',
      vehicleType: 'Comfort SUV',
      vehicleImage: 'suv',
      pickupTime: '2:00 PM',
      pickupLocation: '456 Oak Avenue',
      destination: 'Grand Mall Center',
      status: 'upcoming',
      estimatedFare: 32000,
      estimatedTime: '18 min',
      distance: '12.3 km',
      driverRating: 4.7,
    ),
  ];

  static List<Booking> get rideHistory => [
    const Booking(
      id: '3',
      driverName: 'David Chen',
      vehicleType: 'Economy',
      vehicleImage: 'economy',
      pickupTime: '9:15 AM',
      pickupLocation: '789 Pine Road',
      destination: 'State University',
      status: 'completed',
      estimatedFare: 28750,
      estimatedTime: '22 min',
      distance: '15.1 km',
      driverRating: 4.8,
    ),
    const Booking(
      id: '4',
      driverName: 'Emily Brown',
      vehicleType: 'Premium Sedan',
      vehicleImage: 'sedan',
      pickupTime: '6:30 PM',
      pickupLocation: '321 Elm Street',
      destination: 'City Center',
      status: 'completed',
      estimatedFare: 38250,
      estimatedTime: '30 min',
      distance: '20.8 km',
      driverRating: 4.6,
    ),
    const Booking(
      id: '5',
      driverName: 'James Wilson',
      vehicleType: 'Bike',
      vehicleImage: 'bike',
      pickupTime: '12:00 PM',
      pickupLocation: '555 Maple Drive',
      destination: 'Central Bus Terminal',
      status: 'cancelled',
      estimatedFare: 15000,
      estimatedTime: '12 min',
      distance: '6.2 km',
      driverRating: 4.5,
    ),
  ];
}

class Offer {
  final String id;
  final String title;
  final String description;
  final String discount;
  final String? code;
  final String? expiryDate;
  final bool isNew;

  const Offer({
    required this.id,
    required this.title,
    required this.description,
    required this.discount,
    this.code,
    this.expiryDate,
    this.isNew = false,
  });

  static List<Offer> get dummyOffers => [
    const Offer(
      id: '1',
      title: 'New User Special',
      description: 'Get 40% off on your first 3 rides',
      discount: '40%',
      code: 'WELCOME40',
      expiryDate: 'Dec 31, 2026',
      isNew: true,
    ),
    const Offer(
      id: '2',
      title: 'Weekend Getaway',
      description: 'Flat 25% off on airport rides this weekend',
      discount: '25%',
      code: 'WEEKEND25',
      expiryDate: 'Dec 28, 2026',
      isNew: true,
    ),
    const Offer(
      id: '3',
      title: 'Business Commute',
      description: 'Save 15% on daily commute bookings',
      discount: '15%',
      code: 'COMMUTE15',
      expiryDate: 'Jan 31, 2027',
      isNew: false,
    ),
  ];
}

class AppNotification {
  final String id;
  final String title;
  final String message;
  final String time;
  final String type;
  final bool isRead;

  const AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    required this.type,
    this.isRead = false,
  });

  static List<AppNotification> get dummyNotifications => [
    const AppNotification(
      id: '1',
      title: 'Ride Confirmed',
      message: 'Your ride to International Airport has been confirmed. Driver Mike is on the way.',
      time: '2 min ago',
      type: 'ride',
    ),
    const AppNotification(
      id: '2',
      title: 'Special Offer!',
      message: 'Get 40% off on your next 3 rides. Use code WELCOME40.',
      time: '1 hour ago',
      type: 'offer',
      isRead: true,
    ),
    const AppNotification(
      id: '3',
      title: 'Payment Successful',
      message: 'Your payment of Tsh 45,500 has been processed successfully.',
      time: '3 hours ago',
      type: 'payment',
      isRead: true,
    ),
    const AppNotification(
      id: '4',
      title: 'Rate Your Ride',
      message: 'How was your ride with David? Rate your experience.',
      time: 'Yesterday',
      type: 'rating',
      isRead: true,
    ),
  ];
}

class PaymentMethod {
  final String id;
  final String type;
  final String name;
  final String? lastFour;
  final bool isDefault;
  final String? icon;

  const PaymentMethod({
    required this.id,
    required this.type,
    required this.name,
    this.lastFour,
    this.isDefault = false,
    this.icon,
  });

  static List<PaymentMethod> get dummyPaymentMethods => [
    const PaymentMethod(
      id: '1',
      type: 'cash',
      name: 'Cash',
      isDefault: true,
      icon: 'cash',
    ),
    const PaymentMethod(
      id: '2',
      type: 'card',
      name: 'Visa ending in 4242',
      lastFour: '4242',
      icon: 'visa',
    ),
    const PaymentMethod(
      id: '3',
      type: 'card',
      name: 'Mastercard ending in 8888',
      lastFour: '8888',
      icon: 'mastercard',
    ),
    const PaymentMethod(
      id: '4',
      type: 'wallet',
      name: 'Digital Wallet',
      isDefault: false,
      icon: 'wallet',
    ),
  ];
}
