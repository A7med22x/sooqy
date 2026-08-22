import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/features/profile/domain/use_cases/get_orders.dart';
import 'package:sooqy/features/profile/presentation/cubit/profile_states.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetOrders _getOrders;
  ProfileCubit(this._getOrders) : super(ProfileInitial());

  Future<void> getOrders() async {
    emit(GetOrdersLoading());
    final result = await _getOrders();
    result.fold(
      (failure) => emit(GetOrdersError(failure.message)),
      (orders) => emit(GetOrdersSuccess(orders)),
    );
  }
}
