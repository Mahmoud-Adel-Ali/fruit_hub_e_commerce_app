import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_note.dart';
import '../../../domain/entities/order_entity.dart';
import 'order_info_item.dart';
import 'payment_item.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    var order = context.read<OrderInputEntity>();
    bool payWithCach = order.payWithCash ?? false;
    double shippingPrice = payWithCach ? 0.0 : 20.0;
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
                payWithCach
                    ? OrderInfoItem(
                        title: 'سوف يتم تحديد تكلفه التوصيل عند الدفع',
                        price: 0.0,
                      )
                    : OrderInfoItem(title: "التوصيل :", price: shippingPrice),
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
            spacing: 6,
            children: [
              const SizedBox(),
              Icon(Icons.location_on_outlined, color: AppColors.grey),
              Expanded(
                child: Text(
                  order.shippingAddress.fullAddress,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.regular16.copyWith(
                    color: AppColors.grey.shade500,
                  ),
                ),
              ),
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
        if (payWithCach) ...[
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          CustomNote(
            note:
                'عند اختيار الدفع عند الاستلام، سيتم احتساب تكلفة التوصيل مع إجمالي الطلب. رسوم التوصيل تتراوح عادة بين 10 - 25 جنيه حسب المنطقة.',
          ),
        ],
      ],
    );
  }
}
