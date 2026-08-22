import 'package:dartz/dartz.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/auth/data/models/forget_password_request.dart';
import 'package:sooqy/features/auth/data/models/login_request.dart';
import 'package:sooqy/features/auth/data/models/register_request.dart';
import 'package:sooqy/features/auth/data/models/resend_otp_request.dart';
import 'package:sooqy/features/auth/data/models/reset_password_request.dart';
import 'package:sooqy/features/auth/data/models/validate_otp_request.dart';
import 'package:sooqy/features/auth/data/models/verify_email_request.dart';
import 'package:sooqy/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> register(RegisterRequest request);

  Future<Either<Failure, void>> login(LoginRequest request);

  Future<Either<Failure, User>> getCurrentUser();

  Future<Either<Failure, void>> verifyEmail(VerifyEmailRequest request);

  Future<Either<Failure, void>> forgotPassword(ForgetPasswordRequest request);

  Future<Either<Failure, void>> resendOtp(ResendOtpRequest request);

  Future<Either<Failure, void>> validateOtp(ValidateOtpRequest request);

  Future<Either<Failure, void>> resetPassword(ResetPasswordRequest request);

  Future<Either<Failure, void>> logout();
}
