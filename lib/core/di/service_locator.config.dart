// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:sooqy/core/di/register_module.dart' as _i212;
import 'package:sooqy/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i196;
import 'package:sooqy/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i38;
import 'package:sooqy/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i186;
import 'package:sooqy/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i490;
import 'package:sooqy/features/auth/data/repositories/auth_repository_impl.dart'
    as _i569;
import 'package:sooqy/features/auth/domain/repositories/auh_repository.dart'
    as _i534;
import 'package:sooqy/features/auth/domain/use_cases/forgot_password.dart'
    as _i478;
import 'package:sooqy/features/auth/domain/use_cases/login.dart' as _i683;
import 'package:sooqy/features/auth/domain/use_cases/register.dart' as _i70;
import 'package:sooqy/features/auth/domain/use_cases/verify_email.dart'
    as _i174;
import 'package:sooqy/features/auth/presentation/cubit/auth_cubit.dart'
    as _i445;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPref,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i490.AuthRemoteDataSource>(
      () => _i186.AuthApiRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.singleton<_i196.AuthLocalDataSource>(
      () => _i38.AuthSharedPrefLocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i534.AuthRepository>(
      () => _i569.AuthRepositoryImpl(
        gh<_i490.AuthRemoteDataSource>(),
        gh<_i196.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i478.ForgotPassword>(
      () => _i478.ForgotPassword(gh<_i534.AuthRepository>()),
    );
    gh.singleton<_i683.Login>(() => _i683.Login(gh<_i534.AuthRepository>()));
    gh.singleton<_i70.Register>(
      () => _i70.Register(gh<_i534.AuthRepository>()),
    );
    gh.singleton<_i174.VerifyEmail>(
      () => _i174.VerifyEmail(gh<_i534.AuthRepository>()),
    );
    gh.singleton<_i445.AuthCubit>(
      () => _i445.AuthCubit(
        gh<_i70.Register>(),
        gh<_i683.Login>(),
        gh<_i174.VerifyEmail>(),
        gh<_i478.ForgotPassword>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i212.RegisterModule {}
