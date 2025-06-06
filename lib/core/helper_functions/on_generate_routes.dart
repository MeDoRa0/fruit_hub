import 'package:flutter/material.dart';
import 'package:fruit_hub/features/authentication/presentation/views/login_view.dart';
import 'package:fruit_hub/features/authentication/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/best_selling_fruits/views/best_selling_view.dart';
import 'package:fruit_hub/features/checkout/presentation/views/checkout_views.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/purshaes_success_screen.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';
import 'package:fruit_hub/features/home/presentation/views/main_view.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/favorite_view.dart';

import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case PurchaseSuccessScreen.routeName:
      return MaterialPageRoute(builder: (_) => const PurchaseSuccessScreen());

    case BestSellingView.routeName:
      return MaterialPageRoute(
        builder: (context) => BestSellingView(),
      );
    case CheckoutViews.routeName:
      return MaterialPageRoute(
        builder: (_) => CheckoutViews(
          // Pass the cart items to the CheckoutViews
          cartEntity: settings.arguments as CartEntity,
        ),
      );

    case FavoritesView.routeName:
      return MaterialPageRoute(
        builder: (_) => const FavoritesView(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(),
      );
  }
}
