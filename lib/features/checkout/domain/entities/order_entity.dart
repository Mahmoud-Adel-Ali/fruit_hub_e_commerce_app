import '../../../cart/domain/entities/cart_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddress;

  OrderEntity({
    required this.uId,
    required this.cartEntity,
    required this.shippingAddress,
    this.payWithCash,
  });

  int calcShippingCost() {
    if (payWithCash == true) {
      return 20;
    } else {
      return 0;
    }
  }

  double calcShippingDiscount() {
    return 0;
  }

  double calcTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calcTotalPrice() +
        calcShippingCost() -
        calcShippingDiscount();
  }

  String get currency => "EG";
}
