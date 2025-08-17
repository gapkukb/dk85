class TokenManager {
  String? accessToken;
  String? refreshToken;

  bool get hasToken => accessToken?.isNotEmpty ?? false;

  set(String? accessToken, [String? refreshToken]) {
    if (accessToken == null) {
      accessToken = 'Bearer $accessToken';
    } else {
      accessToken = accessToken;
    }
    refreshToken = refreshToken;
  }

  clear() {
    accessToken = null;
    refreshToken = null;
  }
}
