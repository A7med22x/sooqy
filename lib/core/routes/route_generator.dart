import 'package:flutter/material.dart';
import 'package:sooqy/features/checkout/presentation/screens/add_address_screen.dart';
import 'package:sooqy/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:sooqy/features/home/presentation/screens/notification_screen.dart';
import 'package:sooqy/features/home/presentation/screens/view_more_screen.dart';
import 'package:sooqy/features/onBoarding/presentation/screens/no_internet_screen.dart';
import 'package:sooqy/features/onBoarding/presentation/screens/start_screen.dart';
import 'package:sooqy/features/products/domain/entities/product.dart';
import 'package:sooqy/features/products/presentation/screens/product_datails_screen.dart';
import 'package:sooqy/features/profile/presentation/screens/orders_screen.dart';
import 'package:sooqy/features/profile/presentation/screens/personal_screen.dart';
import 'package:sooqy/features/reviews/presentation/screens/review_screen.dart';
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
      case Routes.start:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.noInternet:
        return MaterialPageRoute(builder: (_) => const NoInternetScreen());
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
      case Routes.notification:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.viewMore:
        final args = settings.arguments as Map<String, dynamic>;
        final title = args['title'] as String;
        final products = args['products'] as List<Product>;
        return MaterialPageRoute(
          builder: (_) => ViewMoreScreen(title: title, products: products),
        );
      case Routes.verifyEmail:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => VerifyEmailScreen(email: email),
        );
      case Routes.categoryProducts:
        final categoryName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => CategoryProductsScreen(categoryName: categoryName),
        );
      case Routes.productDetails:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ProductDatailsScreen(product: product),
        );
      case Routes.personal:
        return MaterialPageRoute(builder: (context) => const PersonalScreen());
      case Routes.orders:
        return MaterialPageRoute(builder: (context) => const OrdersScreen());
      case Routes.checkout:
        return MaterialPageRoute(builder: (context) => const CheckoutScreen());
      case Routes.addAddress:
        return MaterialPageRoute(builder: (context) => const AddAddressScreen());
      case Routes.review:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ReviewScreen(product: product),
        );
      default:
        return null;
    }
  }
}
