import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  // Empty cart
  CartEntity.empty() : cartItems = [];

  //* Add item to cart
  void addItemToCart(CartItemEntity cartItem) {
    //* If the item is in the cart, update the quantity
    //* else add it to the cart
    if (isExistInCart(cartItem)) {
      cartItems
          .firstWhere((item) => item.product == cartItem.product)
          .increaseQuantity();
    } else {
      cartItems.add(cartItem);
    }
  }

  //* Decrease item quantity in cart
  void decreaseItemQuantity(CartItemEntity cartItem) {
    cartItems
        .firstWhere((item) => item.product == cartItem.product)
        .decreaseQuantity();
  }

  //* Remove item from cart
  void removeItemFromCart(CartItemEntity cartItem) {
    cartItems.removeWhere((item) => item.product == cartItem.product);
  }

  //* Check if the item is in the cart
  bool isExistInCart(CartItemEntity cartItem) =>
      cartItems.any((item) => item.product == cartItem.product);

  num calcTotalPrice() {
    num totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.totalPrice;
    }
    return totalPrice;
  }

  @override
  String toString() => 'CartEntity(cartItems: $cartItems)';
}
