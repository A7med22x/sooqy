import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/auth/domain/repositories/auh_repository.dart';

@lazySingleton
class Logout {
  final AuthRepository _repository;
  Logout(this._repository);
  Future<Either<Failure, void>> call() => _repository.logout();
}
