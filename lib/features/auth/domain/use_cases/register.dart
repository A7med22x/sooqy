import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/auth/data/models/register_request.dart';
import 'package:sooqy/features/auth/domain/repositories/auh_repository.dart';

@singleton
class Register {
  final AuthRepository _repository;

  const Register(this._repository);

  Future<Either<Failure, void>> call(RegisterRequest request) =>
      _repository.register(request);
}
