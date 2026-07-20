import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sooqy/core/constants.dart';
import 'package:sooqy/core/di/service_locator.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: APIConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final sharedPref = serviceLocator.get<SharedPreferences>();
          final token = sharedPref.getString(CacheKeys.accessToken);
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
            //options.headers[APIConstants.tokenHeaderKey] = token;
          }
          handler.next(options);
        },
      ),
    );

    return dio;
  }

  @preResolve
  Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();
}
