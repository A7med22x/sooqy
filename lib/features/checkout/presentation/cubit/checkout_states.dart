import 'package:sooqy/features/checkout/domain/entities/address.dart';
import 'package:sooqy/features/checkout/domain/entities/checkout_data.dart';
import 'package:sooqy/features/checkout/domain/entities/copon.dart';

abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class GetAddressesLoading extends CheckoutState {}

class GetAddressesSuccess extends CheckoutState {
  final List<Address> addresses;
  GetAddressesSuccess(this.addresses);
}

class GetAddressesError extends CheckoutState {
  final String message;
  GetAddressesError(this.message);
}

class AddAddressLoading extends CheckoutState {}

class AddAddressSuccess extends CheckoutState {
  final Address addresses;
  AddAddressSuccess(this.addresses);
}

class AddAddressError extends CheckoutState {
  final String message;
  AddAddressError(this.message);
}

class UpdateAddressLoading extends CheckoutState {}

class UpdateAddressSuccess extends CheckoutState {
  final Address addresses;
  UpdateAddressSuccess(this.addresses);
}

class UpdateAddressError extends CheckoutState {
  final String message;
  UpdateAddressError(this.message);
}

class RemoveAddressLoading extends CheckoutState {}

class RemoveAddressSuccess extends CheckoutState {}

class RemoveAddressError extends CheckoutState {
  final String message;
  RemoveAddressError(this.message);
}

class CheckoutLoading extends CheckoutState {}

class CheckoutSuccess extends CheckoutState {
  final CheckoutData checkout;

  CheckoutSuccess(this.checkout);
}

class CheckoutError extends CheckoutState {
  final String message;

  CheckoutError(this.message);
}

class ApplyCouponLoading extends CheckoutState {}

class ApplyCouponSuccess extends CheckoutState {
  final double discount;

  ApplyCouponSuccess(this.discount);
}

class ApplyCouponError extends CheckoutState {
  final String message;

  ApplyCouponError(this.message);
}

class GetCouponsLoading extends CheckoutState {}

class GetCouponsSuccess extends CheckoutState {
  final List<Copon> coupons;

  GetCouponsSuccess(this.coupons);
}

class GetCouponsError extends CheckoutState {
  final String message;

  GetCouponsError(this.message);
}

class CheckoutDataUpdated extends CheckoutState {}
