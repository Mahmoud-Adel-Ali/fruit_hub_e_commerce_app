import 'package:flutter/material.dart';

import '../../../data/models/shipping_address_model.dart';

class ShippingInfoSection extends StatelessWidget {
  final ShippingAddressModel address;

  const ShippingInfoSection({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Shipping Address",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        Text(address.name),
        Text(address.phone),
        Text(address.email),

        const SizedBox(height: 6),

        Text(address.fullAddress, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
