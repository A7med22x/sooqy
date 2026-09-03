import 'package:sooqy/features/auth/domain/entities/user.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterError extends AuthState {
  final String message;

  RegisterError(this.message);
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final User user;

  LoginSuccess(this.user);
}

class LoginError extends AuthState {
  final String message;

  LoginError(this.message);
}

class VerifyEmailLoading extends AuthState {}

class VerifyEmailSuccess extends AuthState {}

class VerifyEmailError extends AuthState {
  final String message;

  VerifyEmailError(this.message);
}

class ResendOtpLoading extends AuthState {}

class ResendOtpSuccess extends AuthState {}

class ResendOtpError extends AuthState {
  final String message;

  ResendOtpError(this.message);
}

class ValidateOtpLoading extends AuthState {}

class ValidateOtpSuccess extends AuthState {}

class ValidateOtpError extends AuthState {
  final String message;

  ValidateOtpError(this.message);
}

class ForgotPasswordLoading extends AuthState {}

class ForgotPasswordSuccess extends AuthState {}

class ForgotPasswordError extends AuthState {
  final String message;

  ForgotPasswordError(this.message);
}

class ResetPasswordLoading extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class ResetPasswordError extends AuthState {
  final String message;

  ResetPasswordError(this.message);
}

class AuthAuthenticated extends AuthState {
  final User user;

  AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {}

class LogoutLoading extends AuthState {}

class LogoutSuccess extends AuthState {}

class LogoutError extends AuthState {
  final String message;
  LogoutError(this.message);
}
