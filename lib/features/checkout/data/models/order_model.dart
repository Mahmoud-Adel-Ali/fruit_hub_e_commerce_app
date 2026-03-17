import '../../domain/entities/order_entity.dart';
import 'order_product_model.dart';
import 'shipping_address_model.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddress;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'totalPrice': totalPrice,
      'uId': uId,
      'status': 'pending',
      'date': DateTime.now().toString(),
      'shippingAddress': shippingAddress.toJson(),
      'orderProducts': orderProducts.map((x) => x.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    totalPrice: json['totalPrice'].toDouble(),
    uId: json['uId'],
    shippingAddress: ShippingAddressModel.fromJson(json['shippingAddress']),
    orderProducts: List<OrderProductModel>.from(
      json['orderProducts'].map((x) => OrderProductModel.fromJson(x)),
    ),
    paymentMethod: json['paymentMethod'],
  );

  factory OrderModel.fromEntity(OrderInputEntity orderEntity) => OrderModel(
    totalPrice: orderEntity.cartEntity.calcTotalPrice().toDouble(),
    uId: orderEntity.uId,
    shippingAddress: ShippingAddressModel.fromEntity(
      orderEntity.shippingAddress,
    ),
    orderProducts: orderEntity.cartEntity.cartItems
        .map((x) => OrderProductModel.fromEntity(x))
        .toList(),
    paymentMethod: orderEntity.payWithCash == true ? 'Cash' : 'Paypal',
  );
}


/// total price
/// uId
/// shipping adress
/// {}
/// 
/// list<orders>
/// 
/// payment method