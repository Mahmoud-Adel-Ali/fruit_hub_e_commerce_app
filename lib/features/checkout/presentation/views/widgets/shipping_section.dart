import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/order_entity.dart';
import 'shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  bool? _payWithCash;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderInputEntity>();
    var price = orderEntity.cartEntity.calcTotalPrice();
    return Column(
      children: [
        SizedBox(height: 16),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          trillingText: '$price  جنيه',
          isSelected: _payWithCash == true,
          onTap: () {
            _payWithCash = true;
            orderEntity.payWithCash = true;
            setState(() {});
          },
        ),
        SizedBox(height: 16),
        ShippingItem(
          title: 'الدفع عبر الإنترنت',
          subtitle: 'بطاقة الائتمان أو الخصم',
          trillingText: '${price + 20} جنيه',
          // trillingText: 'مجاني',
          isSelected: _payWithCash == false,
          onTap: () {
            _payWithCash = false;
            orderEntity.payWithCash = false;
            setState(() {});
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
