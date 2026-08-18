abstract class AuthLocalDataSource {
  Future<void> saveAccessToken(String accessToken);
  Future<String?> getAccessToken();

  Future<void> saveRefreshToken(String refreshToken);
  Future<String?> getRefreshToken();

  Future<void> clearTokens();
}
