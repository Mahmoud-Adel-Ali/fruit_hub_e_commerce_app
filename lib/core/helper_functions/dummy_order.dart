import 'dart:math';

import '../../features/orders/domain/entities/order_output_entity.dart';
import '../../features/orders/domain/entities/order_product_entity.dart';
import '../../features/orders/domain/entities/shipping_address_entity.dart';
import '../enums/order_status.dart';

class DummyOrder {
  static final _random = Random();

  static OrderOutputEntity getOrder() {
    final products = List.generate(3, (index) {
      return OrderProductEntity(
        name: "Product ${index + 1}",
        code: "CODE-${_random.nextInt(9999)}",
        image: "https://via.placeholder.com/150",
        price: (_random.nextInt(300) + 50).toDouble(),
        quantity: _random.nextInt(3) + 1,
      );
    });

    final total = products.fold<double>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    return OrderOutputEntity(
      totalPrice: total,
      orderId: "ORDER_${_random.nextInt(99999)}",
      uId: "USER_${_random.nextInt(99999)}",
      paymentMethod: _random.nextBool() ? "cash" : "card",
      status: OrderStatus.pending,
      shippingAddress: ShippingAddressEntity(
        name: "Test User",
        phone: "01000000000",
        email: "test@mail.com",
        city: "Cairo",
        address: "Nasr City",
        addressDetails: "Street ${_random.nextInt(50)}",
        floor: "${_random.nextInt(10) + 1}",
      ),
      orderProducts: products,
      date: "2026-03-21 13:56:57.908282",
    );
  }
}
