import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/auth/data/models/login_request.dart';
import 'package:sooqy/features/auth/domain/repositories/auh_repository.dart';

@singleton
class Login {
  final AuthRepository _repository;

  const Login(this._repository);

  Future<Either<Failure, void>> call(LoginRequest request) =>
      _repository.login(request);
}
