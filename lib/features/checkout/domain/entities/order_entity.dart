import '../../../cart/domain/entities/cart_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddress;

  OrderEntity({
    required this.cartEntity,
    required this.shippingAddress,
    this.payWithCash,
  });

  // to json
  Map<String, dynamic> toJson() => <String, dynamic>{
    // 'cartEntity': cartEntity.toJson(),
    'shippingAddress': shippingAddress.toJson(),
    'payWithCash': payWithCash,
  };
}
