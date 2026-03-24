// ignore_for_file: public_member_api_docs, sort_constructors_first

class ShippingAddressEntity {
  String name;
  String phone;
  String email;
  String city;
  String address;
  String addressDetails;
  String floor;

  ShippingAddressEntity({
    this.name = '',
    this.phone = '',
    this.email = '',
    this.city = '',
    this.address = '',
    this.addressDetails = '',
    this.floor = '',
  });

  // empty constructor
  ShippingAddressEntity.empty() : this();

  String get fullAddress => '$city - $address - $addressDetails - $floor';
}
