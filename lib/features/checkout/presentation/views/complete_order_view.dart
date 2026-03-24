import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class CompleteOrderView extends StatelessWidget {
  const CompleteOrderView({super.key});
  static const String routeName = 'complete-order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'الطلب',
        showNotifications: false,
        showBack: false,
      ),
    );
  }
}
