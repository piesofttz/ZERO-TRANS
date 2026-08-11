class AppException implements Exception {
  const AppException(this.title, this.message);

  final String title;
  final String message;

  @override
  String toString() => '$title: $message';
}

class NetworkException extends AppException {
  const NetworkException([String message = 'Check your internet connection and try again.'])
      : super('Connection error', message);
}

class BackendUnavailableException extends AppException {
  const BackendUnavailableException([
    String message = 'This feature will be available once the backend is connected.',
  ]) : super('Coming soon', message);
}

class ServerException extends AppException {
  const ServerException([String message = 'Something went wrong. Please try again.'])
      : super('Server error', message);
}
