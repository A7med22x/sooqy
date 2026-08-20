import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:sooqy/features/cart/data/mappers/cart_item_mapper.dart';
import 'package:sooqy/features/cart/domain/entities/cart_item.dart';
import 'package:sooqy/features/cart/domain/repositories/cart_repository.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _dataSource;

  const CartRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, void>> addItemToCart(String productId) async {
    try {
      await _dataSource.addItemToCart(productId);
      return const Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message,));
    }
  }

  @override
  Future<Either<Failure, List<CartItem>>> getCart() async {
    try {
      final response = await _dataSource.getCart();
      return Right(response.items.map((item) => item.toEntity).toList());
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message,));
    }
  }

  @override
  Future<Either<Failure, void>> decreaseItemInCart(String itemId) async {
    try {
      await _dataSource.decreaseItemInCart(itemId);
      return const Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message,));
    }
  }

  @override
  Future<Either<Failure, void>> removeItemFromCart(String itemId) async {
    try {
      await _dataSource.removeItemFromCart(itemId);
      return const Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message,));
    }
  }
}
