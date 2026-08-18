import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/constants.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/features/auth/data/data_sources/local/auth_local_data_source.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  final FlutterSecureStorage _storage;

  AuthSharedPrefLocalDataSource(this._storage);
  @override
  Future<void> saveAccessToken(String accessToken) async {
    try {
      await _storage.write(key: CacheKeys.accessToken, value: accessToken);
    } catch (exception) {
      throw const LocalException('Failed to save access token');
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      return await _storage.read(key: CacheKeys.accessToken);
    } catch (exception) {
      throw const LocalException('Failed to get access token');
    }
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    try {
      await _storage.write(key: CacheKeys.refreshToken, value: refreshToken);
    } catch (exception) {
      throw const LocalException('Failed to save refresh token');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return await _storage.read(key: CacheKeys.refreshToken);
    } catch (exception) {
      throw const LocalException('Failed to get refresh token');
    }
  }

  @override
  Future<void> clearTokens() async {
    await _storage.delete(key: CacheKeys.accessToken);
    await _storage.delete(key: CacheKeys.refreshToken);
  }
}
