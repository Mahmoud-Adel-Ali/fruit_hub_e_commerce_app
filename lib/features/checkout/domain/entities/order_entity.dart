import '../../../cart/domain/entities/cart_entity.dart';
import 'shipping_address_entity.dart';

class OrderInputEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddress;

  OrderInputEntity({
    required this.uId,
    required this.cartEntity,
    required this.shippingAddress,
    this.payWithCash,
  });

  int calcShippingCost() {
    if (payWithCash == true) {
      return 0;
    } else {
      return 20;
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
}
