import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/signin_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/best_selling_fruits/presentation/views/best_selling_view.dart';
import '../../features/cart/domain/entities/cart_entity.dart';
import '../../features/checkout/presentation/views/checkout_view.dart';
import '../../features/checkout/presentation/views/complete_order_view.dart';
import '../../features/home/presentation/views/main_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../../features/orders/presentation/views/orders_view.dart';
import '../../features/profile/presentation/view/about_us_view.dart';
import '../../features/profile/presentation/view/edit_profile_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (_) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSellingView());
    case CheckoutView.routeName:
      var cartEntity = settings.arguments as CartEntity;
      return MaterialPageRoute(
        builder: (_) => CheckoutView(cartEntity: cartEntity),
      );
    case CompleteOrderView.routeName:
      return MaterialPageRoute(builder: (_) => const CompleteOrderView());

    //* This Views is from Profile Feature
    case AboutUsView.routeName:
      return MaterialPageRoute(builder: (_) => const AboutUsView());
    case EditProfileView.routeName:
      return MaterialPageRoute(builder: (_) => const EditProfileView());
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (_) => const OrdersView());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
