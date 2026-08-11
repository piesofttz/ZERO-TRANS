import '../model/login_request.dart';
import '../model/login_response.dart';
import '../model/user_model.dart';

/// TODO(backend): swap this mock for a real POST to ApiEndpoints.login via
/// DioClient.dio once the backend team ships the auth endpoint. Until then
/// any non-empty credentials succeed so the rest of the app can be built
/// and demoed.
class LoginRepository {
  Future<LoginResponse> login(LoginRequest request) async {
    await Future.delayed(const Duration(milliseconds: 700));

    return LoginResponse(
      message: "Login successful",
      accessToken: "mock-token-${DateTime.now().millisecondsSinceEpoch}",
      agent: Agent(
        id: "agent-1",
        name: request.username,
        email: "${request.username}@zerotrans.com",
      ),
    );
  }
}
