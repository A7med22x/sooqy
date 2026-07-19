import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sooqy/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:sooqy/features/auth/data/models/login_request.dart';
import 'package:sooqy/features/auth/data/models/register_request.dart';
import 'package:sooqy/features/auth/data/models/verify_email_request.dart';
import 'package:sooqy/features/auth/domain/repositories/auh_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, void>> register(RegisterRequest request) async {
    try {
      await _remoteDataSource.register(request);
      return Right(null);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> login(LoginRequest request) async {
    try {
      final response = await _remoteDataSource.login(request);
      await _localDataSource.saveAccessToken(response.accessToken);
      await _localDataSource.saveRefreshToken(response.refreshToken);
      return Right(null);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmail(VerifyEmailRequest request) async {
    try {
      await _remoteDataSource.verifyEmail(request);
      return Right(null);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      await _remoteDataSource.forgotPassword(email: email);
      return Right(null);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }
}
