import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/order_product_model.dart';

class ProductsListSection extends StatelessWidget {
  final List<OrderProductModel> products;

  const ProductsListSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Products", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),

        ...products.map((product) => _ProductItem(product: product)),
      ],
    );
  }
}

class _ProductItem extends StatelessWidget {
  final OrderProductModel product;

  const _ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          /// Image
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1.5),
            ),
            child: CachedNetworkImage(
              imageUrl: product.image,
              placeholder: (context, url) => const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),

          const SizedBox(width: 12),

          /// Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Code: ${product.code}",
                  style: const TextStyle(color: Colors.grey),
                ),
                Text("${product.quantity} x ${product.price} EGP"),
              ],
            ),
          ),

          /// Total per item
          Text(
            "${product.quantity * product.price} EGP",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
