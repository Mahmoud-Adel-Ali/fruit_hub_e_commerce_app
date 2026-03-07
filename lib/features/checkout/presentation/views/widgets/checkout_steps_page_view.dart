import 'package:flutter/material.dart';

import 'address_input_section.dart';
import 'payment_section.dart';
import 'shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required PageController pageController,
    required this.formKey,
  }) : _pageController = pageController;

  final PageController _pageController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: PageView.builder(
        itemCount: pages().length,
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => pages()[index],
      ),
    );
  }

  List<Widget> pages() => [
    const ShippingSection(),
    AddressInputSection(formKey: formKey),
    const PaymentSection(),
    // SizedBox(), // Review Section Placeholder
  ];
}
