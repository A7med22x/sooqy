import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/auth/domain/entities/user.dart';
import 'package:sooqy/features/auth/domain/repositories/auh_repository.dart';

@singleton
class GetCurrentUser {
  final AuthRepository _repository;

  const GetCurrentUser(this._repository);

  Future<Either<Failure, User>> call() => _repository.getCurrentUser();
}
