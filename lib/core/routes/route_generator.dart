import 'package:flutter/material.dart';
import 'package:sooqy/features/products/domain/entities/product.dart';
import 'package:sooqy/features/products/presentation/screens/product_datails_screen.dart';
import 'package:sooqy/core/review_screen.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/search_screen.dart';
import 'package:sooqy/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:sooqy/features/auth/presentation/screens/login_screen.dart';
import 'package:sooqy/features/auth/presentation/screens/new_password_screen.dart';
import 'package:sooqy/features/auth/presentation/screens/register_screen.dart';
import 'package:sooqy/features/auth/presentation/screens/verify_code_screen.dart';
import 'package:sooqy/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:sooqy/features/products/presentation/screens/category_products_screen.dart';
import 'package:sooqy/features/home/presentation/screens/home_screen.dart';
import 'package:sooqy/features/onBoarding/presentation/screens/on_boarding_screen.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
        );
      case Routes.verifyCode:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => VerifyCodeScreen(email: email),
        );
      case Routes.newPassword:
        final args = settings.arguments as Map<String, String>;
        final email = args['email']!;
        final code = args['code']!;
        return MaterialPageRoute(
          builder: (context) => NewPasswordScreen(email: email, code: code),
        );
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case Routes.verifyEmail:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => VerifyEmailScreen(email: email),
        );
      case Routes.categoryProducts:
      final categoryName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => CategoryProductsScreen(categoryName: categoryName,),
        );
      case Routes.productDetails:
        final product = settings.arguments as Product;
        return MaterialPageRoute(builder: (_) => ProductDatailsScreen(product: product,));
      case Routes.review:
        return MaterialPageRoute(builder: (_) => const ReviewScreen());
      default:
        return null;
    }
  }
}
