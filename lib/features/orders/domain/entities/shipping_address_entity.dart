class ShippingAddressEntity {
  final String name;
  final String phone;
  final String email;
  final String city;
  final String address;
  final String addressDetails;
  final String floor;

  ShippingAddressEntity({
    required this.name,
    required this.phone,
    required this.email,
    required this.city,
    required this.address,
    required this.addressDetails,
    required this.floor,
  });

  String get fullAddress => '$city - $address - $addressDetails - $floor';
}
