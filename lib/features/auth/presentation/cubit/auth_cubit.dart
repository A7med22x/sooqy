import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/features/auth/data/models/login_request.dart';
import 'package:sooqy/features/auth/data/models/register_request.dart';
import 'package:sooqy/features/auth/data/models/verify_email_request.dart';
import 'package:sooqy/features/auth/domain/use_cases/forgot_password.dart';
import 'package:sooqy/features/auth/domain/use_cases/login.dart';
import 'package:sooqy/features/auth/domain/use_cases/register.dart';
import 'package:sooqy/features/auth/domain/use_cases/verify_email.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_states.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final Register _register;
  final Login _login;
  final VerifyEmail _verifyEmail;
  final ForgotPassword _forgotPassword;

  AuthCubit(
    this._register,
    this._login,
    this._verifyEmail,
    this._forgotPassword,
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
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (_) => emit(LoginSuccess()),
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

  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordLoading());
    final result = await _forgotPassword(email);
    result.fold(
      (failure) => emit(ForgotPasswordError(failure.message)),
      (_) => emit(ForgotPasswordSuccess()),
    );
  }
}
