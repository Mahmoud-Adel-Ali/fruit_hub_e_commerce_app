import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, showNotifications: false, title: 'طلباتي'),
    );
  }
}
