import '../../../cart/domain/entities/cart_item_entity.dart';

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

  factory OrderProductModel.fromEntity(CartItemEntity cartItem) =>
      OrderProductModel(
        name: cartItem.product.name,
        code: cartItem.product.code,
        image: cartItem.product.imgUrl!,
        price: cartItem.product.price,
        quantity: cartItem.quantity,
      );

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
}
