import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/auth/data/models/validate_otp_request.dart';
import 'package:sooqy/features/auth/domain/repositories/auh_repository.dart';

@singleton
class ValidateOtp {
  final AuthRepository _repository;

  const ValidateOtp(this._repository);

  Future<Either<Failure, void>> call(ValidateOtpRequest request) =>
      _repository.validateOtp(request);
}
