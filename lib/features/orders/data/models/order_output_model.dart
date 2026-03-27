import '../../../../core/enums/order_status.dart';
import '../../domain/entities/order_output_entity.dart';
import 'order_product_model.dart';
import 'shipping_address_model.dart';

class OrderOutputModel {
  final double totalPrice;
  final String uId;
  final String orderId;
  final ShippingAddressModel shippingAddress;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final OrderStatus status;

  OrderOutputModel({
    required this.totalPrice,
    required this.uId,
    required this.orderId,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'totalPrice': totalPrice,
      'uId': uId,
      'orderId': orderId,
      'status': status.toJson(),
      'date': DateTime.now().toString(),
      'shippingAddress': shippingAddress.toJson(),
      'orderProducts': orderProducts.map((x) => x.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }

  factory OrderOutputModel.fromJson(Map<String, dynamic> json) =>
      OrderOutputModel(
        totalPrice: json['totalPrice'].toDouble(),
        uId: json['uId'],
        orderId: json['orderId'],
        status: OrderStatusEx.fromJson(json['status']),
        shippingAddress: ShippingAddressModel.fromJson(json['shippingAddress']),
        orderProducts: List<OrderProductModel>.from(
          json['orderProducts'].map((x) => OrderProductModel.fromJson(x)),
        ),
        paymentMethod: json['paymentMethod'],
      );

  OrderOutputEntity toEntity() => OrderOutputEntity(
    totalPrice: totalPrice,
    uId: uId,
    orderId: orderId,
    status: status,
    shippingAddress: shippingAddress.toEntity(),
    orderProducts: orderProducts.map((x) => x.toEntity()).toList(),
    paymentMethod: paymentMethod,
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