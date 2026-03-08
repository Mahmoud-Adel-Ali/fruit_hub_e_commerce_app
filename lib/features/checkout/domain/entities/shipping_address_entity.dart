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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'email': email,
      'city': city,
      'address': address,
      'addressDetails': addressDetails,
      'floor': floor,
    };
  }

  factory ShippingAddressEntity.fromJson(Map<String, dynamic> json) {
    return ShippingAddressEntity(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      addressDetails: json['addressDetails'] as String,
      floor: json['floor'] as String,
    );
  }

  String get fullAddress => '$city - $address - $addressDetails - $floor';
}
