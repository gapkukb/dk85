abstract class TokenManager {
  static String? accessToken;
  static String? refreshToken;

  static set(String? accessToken, [String? refreshToken]) {
    if (accessToken == null) {
      TokenManager.accessToken = 'Bearer $accessToken';
    } else {
      TokenManager.accessToken = accessToken;
    }
    TokenManager.refreshToken = refreshToken;
  }

  static clear() {
    accessToken = null;
    refreshToken = null;
  }
}
