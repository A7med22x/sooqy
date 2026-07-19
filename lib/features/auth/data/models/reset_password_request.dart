class ResetPasswordRequest {
  final String email;
  final String newPassword;
  final String code;

  ResetPasswordRequest({
    required this.email,
    required this.newPassword,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "newPassword": newPassword,
    "otp": code,
  };
}
