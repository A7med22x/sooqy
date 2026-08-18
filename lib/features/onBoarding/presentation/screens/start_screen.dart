import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:sooqy/core/app_preferences.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_states.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<void> _start() async {
    final hasInternet =
        await InternetConnection().hasInternetAccess;

    if (!hasInternet) {
      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        Routes.noInternet,
      );

      return;
    }

    if (!mounted) return;

    context.read<AuthCubit>().getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pushReplacementNamed(
            context,
            Routes.home,
          );
        }

        if (state is AuthUnauthenticated) {
          final route = AppPreferences.onboardingViewed
              ? Routes.login
              : Routes.onBoarding;

          Navigator.pushReplacementNamed(
            context,
            route,
          );
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}