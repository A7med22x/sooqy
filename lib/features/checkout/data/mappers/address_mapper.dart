import 'package:sooqy/features/checkout/data/models/address_response/address_model.dart';
import 'package:sooqy/features/checkout/domain/entities/address.dart';

extension AddressMapper on AddressModel {
  Address get toEntity => Address(
    id: id,
    state: state,
    city: city,
    street: street,
    apartment: apartment,
    phoneNumber: phoneNumber,
    notes: notes,
  );
}
