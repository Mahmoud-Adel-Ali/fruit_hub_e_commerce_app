import 'package:flutter/material.dart';

import '../../../domain/entities/order_output_entity.dart';
import 'orders_items_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});
  final List<OrderOutputEntity> orders;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 12,
        children: [
          const SizedBox(),
          OrdersItemsListView(
            orders: orders,
            // orders: List.generate(10, (index) => DummyOrder.getOrder()),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
