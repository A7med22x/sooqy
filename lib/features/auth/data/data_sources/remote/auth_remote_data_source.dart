import 'package:sooqy/features/auth/data/models/forget_password_request.dart';
import 'package:sooqy/features/auth/data/models/login_request.dart';
import 'package:sooqy/features/auth/data/models/login_response.dart';
import 'package:sooqy/features/auth/data/models/register_request.dart';
import 'package:sooqy/features/auth/data/models/resend_otp_request.dart';
import 'package:sooqy/features/auth/data/models/reset_password_request.dart';
import 'package:sooqy/features/auth/data/models/validate_otp_request.dart';
import 'package:sooqy/features/auth/data/models/verify_email_request.dart';

abstract class AuthRemoteDataSource {
  Future<void> register(RegisterRequest request);

  Future<LoginResponse> login(LoginRequest request);

  Future<void> verifyEmail(VerifyEmailRequest request);

  Future<void> forgotPassword(ForgetPasswordRequest request);

  Future<void> resendOtp(ResendOtpRequest request);

  Future<void> validateOtp(ValidateOtpRequest request);

  Future<void> resetPassword(ResetPasswordRequest request);
}
