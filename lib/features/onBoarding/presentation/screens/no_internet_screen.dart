import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  Future<void> _refresh(BuildContext context) async {
    final hasInternet = await InternetConnection().hasInternetAccess;

    if (!context.mounted) return;

    if (hasInternet) {
      Navigator.pushReplacementNamed(context, Routes.start);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/No_Connection.json'),
            const SizedBox(height: 20),
            const Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Please check your internet connection.'),
            const SizedBox(height: 30),
            CustomElevatedButton(
              isStadiumBorder: false,
              innerPadding: const EdgeInsets.all(16),
              backgroundColor: ColorManager.primaryColor,
              outerPadding: const EdgeInsets.all(16),
              onTap: () => _refresh(context),
              label: 'Refresh',
            ),
          ],
        ),
      ),
    );
  }
}
