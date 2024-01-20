class ShippingAddressModel {
  final String id;
  final String address;
  final String fullName;
  final String city;
  final String country;
  final String state;
  final bool isDefault;
  final String zipCode;

  ShippingAddressModel(
      {required this.id,
      required this.address,
      required this.fullName,
      required this.city,
      required this.country,
      required this.state,
      this.isDefault = false,
      required this.zipCode});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'fullName': fullName,
      'city': city,
      'country': country,
      'state': state,
      'isDefault': isDefault,
      'zipCode': zipCode,
    };
  }

  factory ShippingAddressModel.fromMap(Map<String, dynamic> map,String documentId) {
    return ShippingAddressModel(
      id: documentId,
      address: map['address'] as String,
      fullName: map['fullName'] as String,
      city: map['city'] as String,
      country: map['country'] as String,
      state: map['state'] as String,
      isDefault: map['isDefault'] as bool,
      zipCode: map['zipCode'] as String,
    );
  }
}
