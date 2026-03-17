import '../../../../../core/helper_functions/get_currency.dart';
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

  factory AmountEntity.fromEntity(OrderInputEntity order) {
    return AmountEntity(
      total: order.calcTotalPriceAfterDiscountAndShipping().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(order),
    );
  }
}
