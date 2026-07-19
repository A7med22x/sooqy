import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/auth/data/models/resend_otp_request.dart';
import 'package:sooqy/features/auth/domain/repositories/auh_repository.dart';

@singleton
class ResendOtp {
  final AuthRepository _repository;

  const ResendOtp(this._repository);

  Future<Either<Failure, void>> call(ResendOtpRequest request) =>
      _repository.resendOtp(request);
}
