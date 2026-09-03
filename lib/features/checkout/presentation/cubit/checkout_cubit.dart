import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/features/checkout/data/models/address_response/address_request.dart';
import 'package:sooqy/features/checkout/data/models/checkout_response/checkout_request.dart';
import 'package:sooqy/features/checkout/domain/entities/address.dart';
import 'package:sooqy/features/checkout/domain/use_cases/add_new_address.dart';
import 'package:sooqy/features/checkout/domain/use_cases/apply_copon.dart';
import 'package:sooqy/features/checkout/domain/use_cases/checkout.dart';
import 'package:sooqy/features/checkout/domain/use_cases/get_addresses.dart';
import 'package:sooqy/features/checkout/domain/use_cases/get_copons.dart';
import 'package:sooqy/features/checkout/domain/use_cases/remove_address.dart';
import 'package:sooqy/features/checkout/domain/use_cases/update_address.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_states.dart';

@lazySingleton
class CheckoutCubit extends Cubit<CheckoutState> {
  final GetAddresses _getAddresses;
  final AddNewAddress _addNewAddress;
  final UpdateAddress _updateAddress;
  final RemoveAddress _removeAddress;
  final Checkout _checkout;
  final ApplyCopon _applyCopon;
  final GetCopons _getCopons;

  CheckoutCubit(
    this._getAddresses,
    this._addNewAddress,
    this._updateAddress,
    this._removeAddress,
    this._checkout,
    this._applyCopon,
    this._getCopons,
  ) : super(CheckoutInitial());

  List<Address> addressesList = [];
  String? selectedPaymentMethod;
  Address? selectedAddress;
  double? discount;
  bool isCouponApplied = false;

  void selectPaymentMethod(String paymentMethod) {
    selectedPaymentMethod = paymentMethod;
    emit(CheckoutDataUpdated());
  }

  void selectAddress(Address address) {
    selectedAddress = address;
    emit(CheckoutDataUpdated());
  }

  Future<void> getAllAddress() async {
    emit(GetAddressesLoading());
    final result = await _getAddresses();
    result.fold((failure) => emit(GetAddressesError(failure.message)), (
      addresses,
    ) {
      addressesList = addresses;
      emit(GetAddressesSuccess(addresses));
    });
  }

  Future<void> addNewAddress(AddressRequest address) async {
    emit(AddAddressLoading());
    final result = await _addNewAddress(address);
    result.fold((failure) => emit(AddAddressError(failure.message)), (
      address,
    ) async {
      await refreshGetAddresses();
      emit(AddAddressSuccess(address));
    });
  }

  Future<void> updateAddress(String addressId, AddressRequest address) async {
    emit(UpdateAddressLoading());
    final result = await _updateAddress(addressId, address);
    result.fold((failure) => emit(UpdateAddressError(failure.message)), (
      address,
    ) async {
      await refreshGetAddresses();
      emit(UpdateAddressSuccess(address));
    });
  }

  Future<void> removeAddress(String addressId) async {
    emit(RemoveAddressLoading());
    final result = await _removeAddress(addressId);
    result.fold((failure) => emit(RemoveAddressError(failure.message)), (
      _,
    ) async {
      await refreshGetAddresses();
      emit(RemoveAddressSuccess());
    });
  }

  Future<void> refreshGetAddresses() async {
    final result = await _getAddresses();
    result.fold(
      (failure) {
        emit(GetAddressesError(failure.message));
      },
      (addresses) {
        addressesList = addresses;
        emit(GetAddressesSuccess(addresses));
      },
    );
  }

  Future<void> checkout(CheckoutRequest request) async {
    emit(CheckoutLoading());
    final result = await _checkout(request);
    result.fold(
      (failure) => emit(CheckoutError(failure.message)),
      (response) => emit(CheckoutSuccess(response)),
    );
  }

  Future<void> getCoupons() async {
    emit(GetCouponsLoading());
    final result = await _getCopons();
    result.fold(
      (failure) => emit(GetCouponsError(failure.message)),
      (coupons) => emit(GetCouponsSuccess(coupons)),
    );
  }

  Future<void> applyCoupon(String couponCode) async {
    emit(ApplyCouponLoading());
    final result = await _applyCopon(couponCode);
    result.fold(
      (failure) {
        isCouponApplied = false;
        emit(ApplyCouponError(failure.message));
      },
      (value) {
        discount = value;
        isCouponApplied = true;
        emit(ApplyCouponSuccess(value));
      },
    );
  }
}
