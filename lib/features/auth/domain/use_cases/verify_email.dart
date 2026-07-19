import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/auth/data/models/verify_email_request.dart';
import 'package:sooqy/features/auth/domain/repositories/auh_repository.dart';

@singleton
class VerifyEmail {
  final AuthRepository _repository;

  const VerifyEmail(this._repository);

  Future<Either<Failure, void>> call(VerifyEmailRequest request) =>
      _repository.verifyEmail(request);
}
