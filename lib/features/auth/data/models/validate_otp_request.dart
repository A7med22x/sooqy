class ValidateOtpRequest {
  final String email;
  final String code;

  ValidateOtpRequest({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "otp": code,
      };
}