import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/constants.dart';
import 'package:sooqy/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sooqy/features/auth/data/models/login_response.dart';

@module
abstract class RegisterModule {
  @singleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @singleton
  Dio dio(AuthLocalDataSource storage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: APIConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await storage.getAccessToken();

          if (accessToken != null && accessToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          handler.next(options);
        },

        onError: (error, handler) async {
          if (error.response?.statusCode != 401) {
            return handler.next(error);
          }

          final refreshToken = await storage.getRefreshToken();

          if (refreshToken == null || refreshToken.isEmpty) {
            await storage.clearTokens();
            return handler.next(error);
          }

          try {
            final refreshDio = Dio(BaseOptions(baseUrl: APIConstants.baseUrl));

            final response = await refreshDio.post(
              APIConstants.refreshTokenEndpoint,
              data: {'refreshToken': refreshToken, 'useCookies': false},
            );

            final newTokens = LoginResponse.fromJson(response.data);

            await storage.saveAccessToken(newTokens.accessToken);

            await storage.saveRefreshToken(newTokens.refreshToken);

            final requestOptions = error.requestOptions;

            requestOptions.headers['Authorization'] =
                'Bearer ${newTokens.accessToken}';

            final responseRetry = await dio.fetch(requestOptions);

            return handler.resolve(responseRetry);
          } catch (_) {
            await storage.clearTokens();

            return handler.next(error);
          }
        },
      ),
    );

    return dio;
  }
}
