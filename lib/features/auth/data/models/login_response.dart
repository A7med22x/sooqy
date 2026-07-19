class LoginResponse {
  final String expiresAtUtc;
  final String accessToken;
  final String refreshToken;

  const LoginResponse({
    required this.expiresAtUtc,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      expiresAtUtc: json['expiresAtUtc'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }
}
