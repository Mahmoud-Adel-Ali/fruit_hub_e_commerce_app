import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/toast_helper.dart';
import '../../../domain/entities/order_entity.dart';
import '../../manager/add_order_cubit.dart/add_order_cubit.dart';
import 'checkout_steps.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController _pageController;
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      int next = _pageController.page!.toInt();
      if (currentStep != next) {
        currentStep = next;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(
            currentStep: currentStep,
            pageController: _pageController,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: _pageController,
              formKey: _formKey,
            ),
          ),
          SizedBox(height: 16),
          CustomButton(
            text: getNextButtonText(currentStep),
            onPressed: () {
              if (currentStep == 0) {
                _handleShippingSectionValidation(context);
              } else if (currentStep == 1) {
                _handleAddressValidation(context);
              } else {
                var order = context.read<OrderEntity>();
                context.read<AddOrderCubit>().addOrder(order: order);
              }
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  void _handleShippingSectionValidation(BuildContext context) {
    var order = context.read<OrderEntity>();
    var payWithCash = order.payWithCash;
    if (payWithCash != null) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      ToastHelper.showErrorToast('يرجى اختيار طريقة الدفع');
    }
  }

  String getNextButtonText(int currentStep) {
    switch (currentStep) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'أدفع بواسطه PayPal';
      default:
        return 'التالي';
    }
  }

  void _handleAddressValidation(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
