import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/features/auth/data/models/forget_password_request.dart';
import 'package:sooqy/features/auth/data/models/login_request.dart';
import 'package:sooqy/features/auth/data/models/register_request.dart';
import 'package:sooqy/features/auth/data/models/resend_otp_request.dart';
import 'package:sooqy/features/auth/data/models/reset_password_request.dart';
import 'package:sooqy/features/auth/data/models/validate_otp_request.dart';
import 'package:sooqy/features/auth/data/models/verify_email_request.dart';
import 'package:sooqy/features/auth/domain/entities/user.dart';
import 'package:sooqy/features/auth/domain/use_cases/forgot_password.dart';
import 'package:sooqy/features/auth/domain/use_cases/get_current_user.dart';
import 'package:sooqy/features/auth/domain/use_cases/login.dart';
import 'package:sooqy/features/auth/domain/use_cases/logout.dart';
import 'package:sooqy/features/auth/domain/use_cases/register.dart';
import 'package:sooqy/features/auth/domain/use_cases/resend_otp.dart';
import 'package:sooqy/features/auth/domain/use_cases/reset_password.dart';
import 'package:sooqy/features/auth/domain/use_cases/validate_otp.dart';
import 'package:sooqy/features/auth/domain/use_cases/verify_email.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_states.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  User? user;

  final Register _register;
  final Login _login;
  final GetCurrentUser _getCurrentUser;
  final VerifyEmail _verifyEmail;
  final ForgotPassword _forgotPassword;
  final ResendOtp _resendOtp;
  final ValidateOtp _validateOtp;
  final ResetPassword _resetPassword;
  final Logout _logout;

  AuthCubit(
    this._register,
    this._login,
    this._verifyEmail,
    this._forgotPassword,
    this._resendOtp,
    this._validateOtp,
    this._resetPassword,
    this._getCurrentUser,
    this._logout,
  ) : super(AuthInitial());

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await _register(request);
    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());

    final result = await _login(request);

    await result.fold(
      (failure) async {
        emit(LoginError(failure.message));
      },
      (_) async {
        final userResult = await _getCurrentUser();

        userResult.fold(
          (failure) {
            emit(LoginError(failure.message));
          },
          (user) {
            this.user = user;
            emit(LoginSuccess(user));
          },
        );
      },
    );
  }

  Future<void> getCurrentUser() async {
    final result = await _getCurrentUser();

    result.fold(
      (failure) {
        user = null;
        emit(AuthUnauthenticated());
      },
      (currentUser) {
        user = currentUser;
        emit(AuthAuthenticated(currentUser));
      },
    );
  }

  Future<void> verifyEmail(VerifyEmailRequest request) async {
    emit(VerifyEmailLoading());
    final result = await _verifyEmail(request);
    result.fold(
      (failure) => emit(VerifyEmailError(failure.message)),
      (_) => emit(VerifyEmailSuccess()),
    );
  }

  Future<void> forgotPassword(ForgetPasswordRequest request) async {
    emit(ForgotPasswordLoading());
    final result = await _forgotPassword(request);
    result.fold(
      (failure) => emit(ForgotPasswordError(failure.message)),
      (_) => emit(ForgotPasswordSuccess()),
    );
  }

  Future<void> resendOtp(ResendOtpRequest request) async {
    emit(ResendOtpLoading());
    final result = await _resendOtp(request);
    result.fold(
      (failure) => emit(ResendOtpError(failure.message)),
      (_) => emit(ResendOtpSuccess()),
    );
  }

  Future<void> validateOtp(ValidateOtpRequest request) async {
    emit(ValidateOtpLoading());
    final result = await _validateOtp(request);
    result.fold(
      (failure) => emit(ValidateOtpError(failure.message)),
      (_) => emit(ValidateOtpSuccess()),
    );
  }

  Future<void> resetPassword(ResetPasswordRequest request) async {
    emit(ResetPasswordLoading());
    final result = await _resetPassword(request);
    result.fold(
      (failure) => emit(ResetPasswordError(failure.message)),
      (_) => emit(ResetPasswordSuccess()),
    );
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await _logout();
    result.fold(
      (failure) => emit(LogoutError(failure.message)),
      (_) async {
      user = null;
      emit(LogoutSuccess());
    },
    );
  }
}
