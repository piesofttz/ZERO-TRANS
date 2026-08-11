import 'user_model.dart';

class LoginResponse {
  final String message;
  final String accessToken;
  final Agent agent;

  const LoginResponse({
    required this.message,
    required this.accessToken,
    required this.agent,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json["message"] as String? ?? "",
      accessToken: json["access_token"] as String,
      agent: Agent.fromJson(json["agent"] as Map<String, dynamic>),
    );
  }
}
