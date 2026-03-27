import '../../domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  final String name;
  final String phone;
  final String email;
  final String city;
  final String address;
  final String addressDetails;
  final String floor;

  ShippingAddressModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.city,
    required this.address,
    required this.addressDetails,
    required this.floor,
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

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      addressDetails: json['addressDetails'] as String,
      floor: json['floor'] as String,
    );
  }

  ShippingAddressEntity toEntity() => ShippingAddressEntity(
    name: name,
    phone: phone,
    email: email,
    city: city,
    address: address,
    addressDetails: addressDetails,
    floor: floor,
  );

  String get fullAddress => '$city - $address - $addressDetails - $floor';
}
