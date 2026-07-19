import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/auth/data/models/reset_password_request.dart';
import 'package:sooqy/features/auth/domain/repositories/auh_repository.dart';

@singleton
class ResetPassword {
  final AuthRepository _repository;

  const ResetPassword(this._repository);

  Future<Either<Failure, void>> call(ResetPasswordRequest request) =>
      _repository.resetPassword(request);
}
