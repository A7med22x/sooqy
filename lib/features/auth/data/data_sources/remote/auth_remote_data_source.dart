import 'package:sooqy/features/auth/data/models/login_request.dart';
import 'package:sooqy/features/auth/data/models/login_response.dart';
import 'package:sooqy/features/auth/data/models/register_request.dart';
import 'package:sooqy/features/auth/data/models/verify_email_request.dart';

abstract class AuthRemoteDataSource {
  Future<void> register(RegisterRequest request);

  Future<LoginResponse> login(LoginRequest request);

  Future<void> verifyEmail(VerifyEmailRequest request);

  Future<void> forgotPassword({required String email});
}
