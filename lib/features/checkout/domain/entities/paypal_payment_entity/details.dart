import '../order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };

  factory DetailsEntity.fromEntity(OrderInputEntity order) => DetailsEntity(
    subtotal: order.cartEntity.calcTotalPrice().toString(),
    shipping: order.calcShippingCost().toString(),
    shippingDiscount: order.calcShippingDiscount(),
  );
}
