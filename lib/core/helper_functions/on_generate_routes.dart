import 'package:flutter/material.dart';
import 'package:fruit_hub/features/authentication/presentation/views/login_view.dart';
import 'package:fruit_hub/features/authentication/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/best_selling_fruits.dart/views/best_selling_view.dart';
import 'package:fruit_hub/features/checkout/presentation/views/checkout_views.dart';
import 'package:fruit_hub/features/home/presentation/views/main_view.dart';
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

    case BestSellingView.routeName:
      return MaterialPageRoute(
        builder: (context) => BestSellingView(),
      );
    case CheckoutViews.routeName:
      return MaterialPageRoute(builder: (_) => const CheckoutViews());

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(),
      );
  }
}
