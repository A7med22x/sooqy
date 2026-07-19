import 'package:dartz/dartz.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/auth/data/models/login_request.dart';
import 'package:sooqy/features/auth/data/models/register_request.dart';
import 'package:sooqy/features/auth/data/models/verify_email_request.dart';
abstract class AuthRepository {
  Future<Either<Failure, void>> register(RegisterRequest request);

  Future<Either<Failure, void>> login(LoginRequest request);

  Future<Either<Failure, void>> verifyEmail(VerifyEmailRequest request);

  Future<Either<Failure, void>> forgotPassword({required String email});
}