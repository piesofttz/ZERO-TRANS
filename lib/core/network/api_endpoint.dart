/// Planned REST endpoints.
///
/// None of these are live yet — the backend for ZeroTrans hasn't been built.
/// Repositories reference these constants so that swapping mock data for
/// real HTTP calls later is a one-line change per method.
class ApiEndpoints {
  ApiEndpoints._();

  static const String login = '/auth/login';
  static const String routes = '/routes';
  static String busesForRoute(String routeId) => '/routes/$routeId/buses';
  static String busDetail(String busId) => '/buses/$busId';
  static const String bookTicket = '/tickets/book';
}
