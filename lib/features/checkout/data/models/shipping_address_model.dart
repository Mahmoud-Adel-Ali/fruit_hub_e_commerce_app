// ignore_for_file: public_member_api_docs, sort_constructors_first

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

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      phone: entity.phone,
      email: entity.email,
      city: entity.city,
      address: entity.address,
      addressDetails: entity.addressDetails,
      floor: entity.floor,
    );
  }

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

  String get fullAddress => '$city - $address - $addressDetails - $floor';
}
