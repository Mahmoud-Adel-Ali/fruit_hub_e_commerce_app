import 'package:flutter/material.dart';

import '../../../../core/helper_functions/dummy_order.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, showNotifications: false, title: 'طلباتي'),
      body: OrdersViewBody(
        orders: List.generate(3, (index) => DummyOrder.getOrder()),
      ),
    );
  }
}
