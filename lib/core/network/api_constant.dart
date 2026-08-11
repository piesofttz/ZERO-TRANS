/// Base network configuration.
///
/// TODO(backend): replace with the real API host once the backend team
/// hands off the deployed base URL. Everything under lib/feature/*/repository
/// currently returns mocked data instead of calling this base URL.
class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://api.zerotrans.example.com';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
}
