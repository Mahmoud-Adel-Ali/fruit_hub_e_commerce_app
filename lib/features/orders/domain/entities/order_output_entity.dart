import '../../../../core/enums/order_status.dart';
import 'order_product_entity.dart';
import 'shipping_address_entity.dart';

class OrderOutputEntity {
  final double totalPrice;
  final String uId;
  final String orderId;
  final ShippingAddressEntity shippingAddress;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final OrderStatus status;

  OrderOutputEntity({
    required this.totalPrice,
    required this.uId,
    required this.orderId,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
  });
}
