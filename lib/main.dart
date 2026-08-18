import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/app_bloc_observer.dart';
import 'package:sooqy/core/app_preferences.dart';
import 'package:sooqy/core/app_theme.dart';
import 'package:sooqy/core/di/service_locator.dart';
import 'package:sooqy/core/routes/route_generator.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sooqy/features/products/presentation/cubit/product_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await configureDependencies();
  await AppPreferences.init();
  runApp(SooqyApp());
}

class SooqyApp extends StatelessWidget {
  const SooqyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator.get<AuthCubit>()),
        BlocProvider(create: (_) => serviceLocator.get<ProductCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.start,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
        ),
      ),
    );
  }
}
