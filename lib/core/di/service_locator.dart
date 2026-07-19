import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/di/service_locator.config.dart';

final serviceLocator = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => serviceLocator.init();
