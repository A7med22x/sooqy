import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/home/domain/entities/notification.dart';
import 'package:sooqy/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class GetNotifications {
  final HomeRepository _repository;
  GetNotifications(this._repository);
  Future<Either<Failure, List<Notification>>> call() =>
      _repository.getAllNotifications();
}
