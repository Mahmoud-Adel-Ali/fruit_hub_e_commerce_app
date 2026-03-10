import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/helper_functions/get_user_data.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../cart/domain/entities/cart_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/shipping_address_entity.dart';
import 'widgets/checkout_view_body.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = 'checkout_view';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderEntity(
      uId: getUserData().uId,
      cartEntity: widget.cartEntity,
      shippingAddress: ShippingAddressEntity(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'الشحن', showNotifications: false),
      body: Provider.value(value: orderEntity, child: const CheckoutViewBody()),
    );
  }
}
