import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_toggel_widget.dart';
import '../../../../orders/presentation/views/orders_view.dart';
import '../edit_profile_view.dart';
import 'profile_button.dart';

class GlobalProfileViewSection extends StatelessWidget {
  const GlobalProfileViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'عام',
            style: AppTextStyles.bold19.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 8),
          ProfileButton(
            svg: Assets.imagesUserIcon,
            title: 'الملف الشخصي',
            onTap: () {
              Navigator.pushNamed(context, EditProfileView.routeName);
            },
          ),
          ProfileButton(
            svg: Assets.imagesOrdersIcon,
            title: 'طلباتي',
            onTap: () {
              Navigator.pushNamed(context, OrdersView.routeName);
            },
          ),
          ProfileButton(
            svg: Assets.imagesPaymentCardIcon,
            title: 'المدفوعات',
            onTap: () {},
          ),
          ProfileButton(
            svg: Assets.imagesFavoriteIcon,
            title: 'المفضلة',
            onTap: () {},
          ),
          ProfileButton(
            svg: Assets.imagesNotificationIcon,
            title: 'الاشعارات',
            trailing: CustomToggleWidget(
              initialValue: true,
              onChanged: (val) {},
            ),
          ),
          ProfileButton(
            svg: Assets.imagesLanguageIcon,
            title: 'اللغة',
            subtitle: 'العربية',
            onTap: () {},
          ),
          ProfileButton(
            svg: Assets.imagesProfileModeIcon,
            title: 'الوضع',
            trailing: CustomToggleWidget(
              initialValue: false,
              onChanged: (val) {},
            ),
          ),
        ],
      ),
    );
  }
}
