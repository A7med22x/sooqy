import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class ReadNotification {
  final HomeRepository _repository;
  ReadNotification(this._repository);
  Future<Either<Failure, void>> call(String notiId) =>
      _repository.markNotificationAsRead(notiId: notiId);
}
