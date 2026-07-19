import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/constants.dart';
import 'package:sooqy/core/errors/error_helper.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:sooqy/features/auth/data/models/forget_password_request.dart';
import 'package:sooqy/features/auth/data/models/login_request.dart';
import 'package:sooqy/features/auth/data/models/login_response.dart';
import 'package:sooqy/features/auth/data/models/register_request.dart';
import 'package:sooqy/features/auth/data/models/resend_otp_request.dart';
import 'package:sooqy/features/auth/data/models/reset_password_request.dart';
import 'package:sooqy/features/auth/data/models/validate_otp_request.dart';
import 'package:sooqy/features/auth/data/models/verify_email_request.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  final Dio _dio;

  AuthApiRemoteDataSource(this._dio);

  @override
  Future<void> register(RegisterRequest request) async {
    try {
      await _dio.post(APIConstants.registerEndpoint, data: request.toJson());
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to register');
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        APIConstants.loginEndpoint,
        data: request.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to login');
    }
  }

  @override
  Future<void> verifyEmail(VerifyEmailRequest request) async {
    try {
      await _dio.post(
        APIConstants.verifyEmailEndpoint,
        data: request.toJson(),
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to verify email');
    }
  }

  @override
  Future<void> forgotPassword(ForgetPasswordRequest request) async {
    try {
      await _dio.post(
        APIConstants.forgotPasswordEndpoint,
        data: request.toJson(),
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to reset password');
    }
  }

  @override
  Future<void> resendOtp(ResendOtpRequest request) async {
    try {
      await _dio.post(
        APIConstants.resendOtpEndpoint,
        data: request.toJson(),
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to reset password');
    }
  }

  @override
  Future<void> validateOtp(ValidateOtpRequest request) async {
    try {
      await _dio.post(
        APIConstants.validateOtpEndpoint,
        data: request.toJson(),
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to reset password');
    }
  }

  @override
  Future<void> resetPassword(ResetPasswordRequest request) async {
    try {
      await _dio.post(
        APIConstants.resetPasswordEndpoint,
        data: request.toJson(),
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to reset password');
    }
  }
}
