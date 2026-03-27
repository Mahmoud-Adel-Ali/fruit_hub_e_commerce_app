import '../../domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String image;
  final num price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.image,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'code': code,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json['name'] as String,
      code: json['code'] as String,
      image: json['image'] as String,
      price: json['price'] as num,
      quantity: json['quantity'] as int,
    );
  }

  OrderProductEntity toEntity() => OrderProductEntity(
    name: name,
    code: code,
    image: image,
    price: price,
    quantity: quantity,
  );
}
