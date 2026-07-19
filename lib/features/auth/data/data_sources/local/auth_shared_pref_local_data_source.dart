import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sooqy/core/constants.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/features/auth/data/data_sources/local/auth_local_data_source.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  final SharedPreferences _sharedPref;

  AuthSharedPrefLocalDataSource(this._sharedPref);
  @override
  Future<void> saveAccessToken(String accessToken) async {
    try {
      await _sharedPref.setString(CacheKeys.accessToken, accessToken);
    } catch (exception) {
      throw const LocalException('Failed to save access token');
    }
  }

  @override
  Future<String> getAccessToken() async {
    try {
      return _sharedPref.getString(CacheKeys.accessToken)!;
    } catch (exception) {
      throw const LocalException('Failed to get access token');
    }
  }
  
  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    try {
      await _sharedPref.setString(CacheKeys.refreshToken, refreshToken);
    } catch (exception) {
      throw const LocalException('Failed to save refresh token');
    }
  }

  @override
  Future<String> getRefreshToken() async {
    try {
      return _sharedPref.getString(CacheKeys.refreshToken)!;
    } catch (exception) {
      throw const LocalException('Failed to get refresh token');
    }
  }
}
