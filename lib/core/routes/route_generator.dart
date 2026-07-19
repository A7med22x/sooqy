import 'package:flutter/material.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/search_screen.dart';
import 'package:sooqy/features/auth/presentation/screens/login_screen.dart';
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
      // case Routes.register:
      //   return MaterialPageRoute(builder: (context) => const RegisterScreen());
      // case Routes.forgetPassword:
      //   return MaterialPageRoute(
      //     builder: (context) => const ForgetPasswordScreen(),
      //   );
      // case Routes.verifyCode:
      //   final email = settings.arguments as String;
      //   return MaterialPageRoute(
      //     builder: (context) => VerifyCodeScreen(email: email),
      //   );
      // case Routes.newPassword:
      //   final args = settings.arguments as Map<String, String>;
      //   final email = args['email']!;
      //   final code = args['code']!;
      //   return MaterialPageRoute(
      //     builder: (context) => NewPasswordScreen(email: email, code: code),
      //   );
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      // case Routes.verifyEmail:
      //   final email = settings.arguments as String;
      //   return MaterialPageRoute(
      //     builder: (context) => VerifyEmailScreen(email: email),
      //   );
      default:
        return null;
    }
  }
}
