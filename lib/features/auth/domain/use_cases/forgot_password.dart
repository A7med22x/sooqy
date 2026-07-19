import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/auth/domain/repositories/auh_repository.dart';

@singleton
class ForgotPassword {
  final AuthRepository _repository;

  const ForgotPassword(this._repository);

  Future<Either<Failure, void>> call(String email) =>
      _repository.forgotPassword(email: email);
}
