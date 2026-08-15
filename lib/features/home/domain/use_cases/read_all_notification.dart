import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class ReadAllNotification {
  final HomeRepository _repository;
  ReadAllNotification(this._repository);
  Future<Either<Failure, void>> call(List<String> notiIds) =>
      _repository.markAllNotificationsAsRead(notiIds: notiIds);
}
