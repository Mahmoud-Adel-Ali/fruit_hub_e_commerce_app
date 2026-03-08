import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/order_entity.dart';
import 'order_info_item.dart';
import 'payment_item.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    var order = context.read<OrderEntity>();
    double shippingPrice = 20.0;
    return Column(
      children: [
        PaymentItem(
          title: "ملخص الطلب",
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                OrderInfoItem(
                  title: "المجموع الفرعي :",
                  price: order.cartEntity.calcTotalPrice().toDouble(),
                ),
                OrderInfoItem(title: "التوصيل :", price: shippingPrice),
                Divider(),
                OrderInfoItem(
                  title: "الكلي",
                  price:
                      order.cartEntity.calcTotalPrice().toDouble() +
                      shippingPrice,
                  isTotal: true,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        PaymentItem(
          title: 'عنوان التوصيل',
          child: Row(
            children: [
              const SizedBox(width: 8.0),
              Icon(Icons.location_on_outlined, color: AppColors.grey),
              const SizedBox(width: 8.0),
              Text(
                order.shippingAddress.fullAddress,
                style: AppTextStyles.regular16.copyWith(
                  color: AppColors.grey.shade500,
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {
                  pageController.animateToPage(
                    pageController.page!.toInt() - 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                label: Text(
                  "تعديل",
                  style: AppTextStyles.bold13.copyWith(color: AppColors.grey),
                ),
                icon: Icon(
                  Icons.edit_outlined,
                  size: 16.0,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
