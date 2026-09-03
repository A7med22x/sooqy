class AddressRequest {
  final String? id;
  final String? state;
  final String? city;
  final String? street;
  final String? apartment;
  final String? phoneNumber;
  final String? notes;

  AddressRequest({
    this.id,
    this.state,
    this.city,
    this.street,
    this.apartment,
    this.phoneNumber,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "state": state,
      "city": city,
      "street": street,
      "apartment": apartment,
      "phoneNumber": phoneNumber,
      "notes": notes,
    };
  }
}
