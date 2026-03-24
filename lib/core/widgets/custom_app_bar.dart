import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';
import 'notifications_icon_widget.dart';

AppBar customAppBar(
  BuildContext context, {
  required String title,
  bool showBack = true,
  bool showNotifications = true,
}) {
  return AppBar(
    backgroundColor: AppColors.white,
    flexibleSpace: Container(color: AppColors.white),
    centerTitle: true,
    actions: [if (showNotifications) NotificationsIconwidget()],
    leading: showBack
        ? Container(
            margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            decoration: ShapeDecoration(
              color: AppColors.white,
              shape: OvalBorder(
                side: BorderSide(width: 1, color: const Color(0xFFF1F1F5)),
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(Assets.imagesArrowBackIcon),
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pop(context),
            ),
          )
        : SizedBox.shrink(),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppTextStyles.bold19.copyWith(color: const Color(0xFF0C0D0D)),
    ),
  );
}
