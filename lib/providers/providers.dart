import 'package:flutter/material.dart';
import '../models/models.dart';

class HomeProvider extends ChangeNotifier {
  TransportCategory _selectedCategory = TransportCategory.defaults.first;
  int _currentNavIndex = 0;
  bool _isLoading = false;

  TransportCategory get selectedCategory => _selectedCategory;
  int get currentNavIndex => _currentNavIndex;
  bool get isLoading => _isLoading;

  void selectCategory(TransportCategory category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }
}

class SearchProvider extends ChangeNotifier {
  String _pickupLocation = '';
  String _dropLocation = '';
  List<String> _recentSearches = [
    'International Airport',
    'Grand Mall Center',
    'State University',
  ];

  String get pickupLocation => _pickupLocation;
  String get dropLocation => _dropLocation;
  List<String> get recentSearches => _recentSearches;

  void setPickupLocation(String location) {
    _pickupLocation = location;
    notifyListeners();
  }

  void setDropLocation(String location) {
    _dropLocation = location;
    notifyListeners();
  }

  void addRecentSearch(String search) {
    _recentSearches.insert(0, search);
    if (_recentSearches.length > 5) {
      _recentSearches.removeLast();
    }
    notifyListeners();
  }
}

class BookingProvider extends ChangeNotifier {
  List<Booking> _upcomingBookings = Booking.dummyBookings;
  List<Booking> _rideHistory = Booking.rideHistory;
  Booking? _selectedBooking;

  List<Booking> get upcomingBookings => _upcomingBookings;
  List<Booking> get rideHistory => _rideHistory;
  Booking? get selectedBooking => _selectedBooking;

  void selectBooking(Booking booking) {
    _selectedBooking = booking;
    notifyListeners();
  }

  void cancelBooking(String id) {
    _upcomingBookings.removeWhere((b) => b.id == id);
    notifyListeners();
  }
}

class WalletProvider extends ChangeNotifier {
  double _balance = 156500;
  List<PaymentMethod> _paymentMethods = PaymentMethod.dummyPaymentMethods;

  double get balance => _balance;
  List<PaymentMethod> get paymentMethods => _paymentMethods;

  void addBalance(double amount) {
    _balance += amount;
    notifyListeners();
  }

  void deductBalance(double amount) {
    _balance -= amount;
    notifyListeners();
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
