import '../order_entity.dart';
import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  AmountEntity? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };

  factory PaypalPaymentEntity.fromEntity(OrderEntity order) {
    return PaypalPaymentEntity(
      amount: AmountEntity.fromEntity(order),
      description: "Payment Description.",
      itemList: ItemList.fromEntity(order.cartEntity.cartItems),
    );
  }
}
