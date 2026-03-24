import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';

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
      body: CompleteOrderViewBody(),
    );
  }
}

class CompleteOrderViewBody extends StatelessWidget {
  const CompleteOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 200,
            width: 200,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset(Assets.imagesOrderCompletedIcon),
            ),
          ),
          const SizedBox(height: 16),
          Text('تم الطلب بنجاح!', style: AppTextStyles.bold19),
          const Spacer(flex: 2),
          CustomButton(
            text: 'الذهاب للرئيسية',
            onPressed: () =>
                Navigator.popUntil(context, (route) => route.isFirst),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
