import '../../../../../core/helper_functions/get_currency.dart';
import '../../../../cart/domain/entities/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  factory ItemEntity.fromEntity(CartItemEntity cart) {
    return ItemEntity(
      quantity: cart.quantity,
      name: cart.product.name,
      price: cart.product.price.toString(),
      currency: getCurrency(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
