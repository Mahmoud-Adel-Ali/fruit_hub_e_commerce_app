import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../cart/domain/entities/cart_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/shipping_address_entity.dart';
import 'widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = 'checkout_view';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'الشحن', showNotifications: false),
      body: Provider.value(
        value: OrderEntity(
          cartEntity: cartEntity,
          shippingAddress: ShippingAddressEntity(),
        ),
        child: const CheckoutViewBody(),
      ),
    );
  }
}
