import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/sign_in_view.dart';
import 'package:pharmacy_app/feature/auth/presentation/view/sign_up_view.dart';
import 'package:pharmacy_app/feature/home/data/model/product_model.dart';
import 'package:pharmacy_app/feature/home/entities/cart_item_entity.dart';
import 'package:pharmacy_app/feature/home/presentation/view/category_view.dart';
import 'package:pharmacy_app/feature/home/presentation/view/home_view.dart';
import 'package:pharmacy_app/feature/home/presentation/view/main_view.dart';
import 'package:pharmacy_app/feature/home/presentation/view/cart_view.dart';
import 'package:pharmacy_app/feature/onboarding/presentation/view/onboarding_view.dart';
import 'package:pharmacy_app/feature/home/presentation/view/profile_view.dart';
import 'package:pharmacy_app/feature/product_details/presentation/view/product_details_view.dart';
import 'package:pharmacy_app/feature/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // splash view
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());

    // onboarding view
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnboardingView());

    // sign in view
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => SignInView());

    // sign up view
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => SignUpView());

    // main view
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => MainView());

    // home view
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());

    // profile view
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => ProfileView());

    // category view
    case CategoryView.routeName:
      return MaterialPageRoute(builder: (context) => CategoryView());

    // order view
    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => CartView());

    // product details view
    case ProductDetailsView.routeName:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args['product'] as ProductModel;
      final cartItem = args['cartItem'] as CartItemEntity;

      return MaterialPageRoute(
        builder: (context) => ProductDetailsView(
          productModel: product,
          cartItemEntity: cartItem,
        ),
      );

    // default
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
