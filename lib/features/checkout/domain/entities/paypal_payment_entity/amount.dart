import '../order_entity.dart';
import 'details.dart';

class AmountEntity {
  String? total;
  String? currency;
  DetailsEntity? details;

  AmountEntity({this.total, this.currency, this.details});

  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };

  factory AmountEntity.fromEntity(OrderEntity order) {
    return AmountEntity(
      total: order.calcTotalPriceAfterDiscountAndShipping().toString(),
      currency: order.currency,
      details: DetailsEntity.fromEntity(order),
    );
  }
}
