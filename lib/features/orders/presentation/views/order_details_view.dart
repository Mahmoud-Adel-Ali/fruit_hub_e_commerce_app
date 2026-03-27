import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/entities/order_output_entity.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.order});
  final OrderOutputEntity order;

  static const String routeName = 'order_detais_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        showNotifications: false,
        title: 'تفاصيل الطلب',
      ),
    );
  }
}
