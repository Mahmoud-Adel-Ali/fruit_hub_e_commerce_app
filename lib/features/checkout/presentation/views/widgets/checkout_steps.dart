import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/toast_helper.dart';
import '../../../domain/entities/order_entity.dart';
import 'step_item.dart';

List<String> steps = [
  'الشحن', 'العنوان', 'الدفع',
  //  'المراجعه'
];

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentStep,
    required this.pageController,
  });
  final int currentStep;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(steps.length, (index) {
        return Expanded(
          child: StepItem(
            text: steps[index],
            index: index,
            isActive: index <= currentStep,
            onTap: () {
              var order = context.read<OrderEntity>();
              var payWithCash = order.payWithCash;
              if (payWithCash == null && index > 0) {
                ToastHelper.showErrorToast('يرجى اختيار طريقة الدفع');
                return;
              }
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        );
      }),
    );
  }
}
