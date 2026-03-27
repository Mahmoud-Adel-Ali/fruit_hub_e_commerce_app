import 'package:flutter/material.dart';

import '../../../../../core/enums/order_status.dart';
import '../../../../../core/helper_functions/formate_date.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../domain/entities/order_output_entity.dart';
import '../order_details_view.dart';

List<OrderStep> buildSteps(OrderStatus status) {
  final allSteps = [
    OrderStep("تتبع الطلب"),
    OrderStep("قبول الطلب"),
    OrderStep("تم شحن الطلب"),
    OrderStep("خرج للتوصيل"),
    OrderStep("تم التسليم"),
  ];

  int activeIndex;

  switch (status) {
    case OrderStatus.pending:
      activeIndex = 0;
      break;
    case OrderStatus.accepted:
      activeIndex = 1;
      break;
    case OrderStatus.delivered:
      activeIndex = 4;
      break;
    case OrderStatus.cancelled:
      activeIndex = -1;
      break;
  }

  for (int i = 0; i < allSteps.length; i++) {
    allSteps[i] = allSteps[i].copyWith(
      isDone: i <= activeIndex,
      isActive: i == activeIndex,
    );
  }

  return allSteps;
}

class OrderStep {
  final String title;
  final bool isDone;
  final bool isActive;

  OrderStep(this.title, {this.isDone = false, this.isActive = false});

  OrderStep copyWith({bool? isDone, bool? isActive}) {
    return OrderStep(
      title,
      isDone: isDone ?? this.isDone,
      isActive: isActive ?? this.isActive,
    );
  }
}

class OrderCartItem extends StatefulWidget {
  final OrderOutputEntity order;

  const OrderCartItem({super.key, required this.order});

  @override
  State<OrderCartItem> createState() => _OrderCartItemState();
}

class _OrderCartItemState extends State<OrderCartItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final steps = buildSteps(widget.order.status);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          /// 🔹 HEADER
          InkWell(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Icon
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.inventory_2_outlined,
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(width: 8),

                  /// Order Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Order Number (Id)
                        Row(
                          children: [
                            Text(
                              "طلب رقم: #",
                              style: AppTextStyles.semiBold16,
                              textDirection: TextDirection.rtl,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                widget.order.orderId,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.semiBold16,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),

                        /// Order date
                        Text(
                          formatDate(widget.order.date),
                          style: AppTextStyles.medium15.copyWith(
                            color: Colors.grey,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "عدد الطلبات: ${widget.order.orderProducts.length} - ${widget.order.totalPrice} جنيه",
                          style: AppTextStyles.medium15,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                ],
              ),
            ),
          ),

          /// 🔹 EXPANDED CONTENT
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Divider(),

                  /// 🔹 STEPPER
                  _OrderStepper(steps: steps),

                  const SizedBox(height: 12),

                  CustomTextButton(
                    text: 'عرض تفاصيل الطلب',
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        OrderDetailsView.routeName,
                        arguments: widget.order,
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _OrderStepper extends StatelessWidget {
  final List<OrderStep> steps;

  const _OrderStepper({required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// DOT + LINE
            Column(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: step.isDone ? Colors.green : Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                ),
                if (index != steps.length - 1)
                  Container(
                    width: 2,
                    height: 40,
                    color: step.isDone ? Colors.green : Colors.grey.shade300,
                  ),
              ],
            ),

            const SizedBox(width: 12),

            /// TEXT
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.title,
                      style: AppTextStyles.medium15.copyWith(
                        color: step.isDone ? Colors.black : Colors.grey,
                        fontWeight: step.isActive
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    // const SizedBox(height: 4),
                    // const Text(
                    //   "22 مارس 2024",
                    //   style: TextStyle(fontSize: 12, color: Colors.grey),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
