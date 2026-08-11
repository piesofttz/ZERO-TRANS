import 'package:get_storage/get_storage.dart';

class StorageService {
  StorageService._();

  static final GetStorage _box = GetStorage();

  static const _keyHasSeenOnboarding = 'has_seen_onboarding';
  static const _keyAccessToken = 'access_token';
  static const _keyAgentName = 'agent_name';
  static const _keyAgentEmail = 'agent_email';

  static bool getHasSeenOnboarding() {
    return _box.read<bool>(_keyHasSeenOnboarding) ?? false;
  }

  static Future<void> saveHasSeenOnboarding() {
    return _box.write(_keyHasSeenOnboarding, true);
  }

  static String? getAccessToken() {
    return _box.read<String>(_keyAccessToken);
  }

  static Future<void> saveSession({
    required String accessToken,
    required String agentName,
    required String agentEmail,
  }) async {
    await _box.write(_keyAccessToken, accessToken);
    await _box.write(_keyAgentName, agentName);
    await _box.write(_keyAgentEmail, agentEmail);
  }

  static String getAgentName() => _box.read<String>(_keyAgentName) ?? 'Agent';

  static String getAgentEmail() => _box.read<String>(_keyAgentEmail) ?? '';

  static Future<void> clearSession() async {
    await _box.remove(_keyAccessToken);
    await _box.remove(_keyAgentName);
    await _box.remove(_keyAgentEmail);
  }
}
