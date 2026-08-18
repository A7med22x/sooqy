// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
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
import 'package:sooqy/features/auth/domain/use_cases/get_current_user.dart'
    as _i234;
import 'package:sooqy/features/auth/domain/use_cases/login.dart' as _i683;
import 'package:sooqy/features/auth/domain/use_cases/register.dart' as _i70;
import 'package:sooqy/features/auth/domain/use_cases/resend_otp.dart' as _i651;
import 'package:sooqy/features/auth/domain/use_cases/reset_password.dart'
    as _i412;
import 'package:sooqy/features/auth/domain/use_cases/validate_otp.dart' as _i32;
import 'package:sooqy/features/auth/domain/use_cases/verify_email.dart'
    as _i174;
import 'package:sooqy/features/auth/presentation/cubit/auth_cubit.dart'
    as _i445;
import 'package:sooqy/features/categories/data/data_sources/remote/categories_remote_data_source.dart'
    as _i883;
import 'package:sooqy/features/categories/data/data_sources/remote/categories_remote_data_source_impl.dart'
    as _i24;
import 'package:sooqy/features/categories/data/repositories/category_repository_impl.dart'
    as _i810;
import 'package:sooqy/features/categories/domain/repositories/category_repository.dart'
    as _i775;
import 'package:sooqy/features/categories/domain/use_cases/get_categories.dart'
    as _i526;
import 'package:sooqy/features/categories/presentation/cubit/category_cubit.dart'
    as _i421;
import 'package:sooqy/features/home/data/data_sources/home_api_remote_data_source.dart'
    as _i114;
import 'package:sooqy/features/home/data/data_sources/home_remote_data_source.dart'
    as _i728;
import 'package:sooqy/features/home/data/repositories/home_repository_impl.dart'
    as _i968;
import 'package:sooqy/features/home/domain/repositories/home_repository.dart'
    as _i942;
import 'package:sooqy/features/home/domain/use_cases/get_notifications.dart'
    as _i268;
import 'package:sooqy/features/home/domain/use_cases/get_offers.dart' as _i1041;
import 'package:sooqy/features/home/domain/use_cases/read_all_notification.dart'
    as _i611;
import 'package:sooqy/features/home/domain/use_cases/read_notification.dart'
    as _i368;
import 'package:sooqy/features/home/presentation/cubit/home_cubit.dart'
    as _i148;
import 'package:sooqy/features/products/data/data_sources/products_remote_data_source.dart'
    as _i903;
import 'package:sooqy/features/products/data/data_sources/products_remote_data_source_impl.dart'
    as _i441;
import 'package:sooqy/features/products/data/repositories/product_repository_impl.dart'
    as _i189;
import 'package:sooqy/features/products/domain/repositories/product_repository.dart'
    as _i205;
import 'package:sooqy/features/products/domain/use_cases/get_products.dart'
    as _i434;
import 'package:sooqy/features/products/presentation/cubit/product_cubit.dart'
    as _i753;
import 'package:sooqy/features/reviews/data/data_sources/remote/review_api_remote_data_source.dart'
    as _i578;
import 'package:sooqy/features/reviews/data/data_sources/remote/review_remote_data_source.dart'
    as _i532;
import 'package:sooqy/features/reviews/data/repositories/review_repository_impl.dart'
    as _i369;
import 'package:sooqy/features/reviews/domin/repositories/review_repository.dart'
    as _i492;
import 'package:sooqy/features/reviews/domin/use_cases/add_review.dart'
    as _i212;
import 'package:sooqy/features/reviews/domin/use_cases/get_reviews.dart'
    as _i315;
import 'package:sooqy/features/reviews/presentation/cubit/review_cubit.dart'
    as _i77;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.singleton<_i196.AuthLocalDataSource>(
      () =>
          _i38.AuthSharedPrefLocalDataSource(gh<_i558.FlutterSecureStorage>()),
    );
    gh.singleton<_i361.Dio>(
      () => registerModule.dio(gh<_i196.AuthLocalDataSource>()),
    );
    gh.lazySingleton<_i883.CategoriesRemoteDataSource>(
      () => _i24.CategoriesRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.singleton<_i490.AuthRemoteDataSource>(
      () => _i186.AuthApiRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i903.ProductsRemoteDataSource>(
      () => _i441.ProductsRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i532.ReviewRemoteDataSource>(
      () => _i578.ReviewApiRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i728.HomeRemoteDataSource>(
      () => _i114.HomeApiRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i942.HomeRepository>(
      () => _i968.HomeRepositoryImpl(gh<_i728.HomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i205.ProductRepository>(
      () => _i189.ProductRepositoryImpl(gh<_i903.ProductsRemoteDataSource>()),
    );
    gh.lazySingleton<_i268.GetNotifications>(
      () => _i268.GetNotifications(gh<_i942.HomeRepository>()),
    );
    gh.lazySingleton<_i1041.GetOffers>(
      () => _i1041.GetOffers(gh<_i942.HomeRepository>()),
    );
    gh.lazySingleton<_i611.ReadAllNotification>(
      () => _i611.ReadAllNotification(gh<_i942.HomeRepository>()),
    );
    gh.lazySingleton<_i368.ReadNotification>(
      () => _i368.ReadNotification(gh<_i942.HomeRepository>()),
    );
    gh.lazySingleton<_i775.CategoryRepository>(
      () =>
          _i810.CategoryRepositoryImpl(gh<_i883.CategoriesRemoteDataSource>()),
    );
    gh.lazySingleton<_i526.GetCategories>(
      () => _i526.GetCategories(gh<_i775.CategoryRepository>()),
    );
    gh.singleton<_i534.AuthRepository>(
      () => _i569.AuthRepositoryImpl(
        gh<_i490.AuthRemoteDataSource>(),
        gh<_i196.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i492.ReviewRepository>(
      () => _i369.ReviewRepositoryImpl(gh<_i532.ReviewRemoteDataSource>()),
    );
    gh.lazySingleton<_i212.AddReview>(
      () => _i212.AddReview(gh<_i492.ReviewRepository>()),
    );
    gh.lazySingleton<_i315.GetReviews>(
      () => _i315.GetReviews(gh<_i492.ReviewRepository>()),
    );
    gh.lazySingleton<_i434.GetProducts>(
      () => _i434.GetProducts(gh<_i205.ProductRepository>()),
    );
    gh.factory<_i148.HomeCubit>(
      () => _i148.HomeCubit(
        gh<_i1041.GetOffers>(),
        gh<_i268.GetNotifications>(),
        gh<_i368.ReadNotification>(),
        gh<_i611.ReadAllNotification>(),
      ),
    );
    gh.factory<_i753.ProductCubit>(
      () => _i753.ProductCubit(gh<_i434.GetProducts>()),
    );
    gh.lazySingleton<_i421.CategoryCubit>(
      () => _i421.CategoryCubit(gh<_i526.GetCategories>()),
    );
    gh.singleton<_i478.ForgotPassword>(
      () => _i478.ForgotPassword(gh<_i534.AuthRepository>()),
    );
    gh.singleton<_i234.GetCurrentUser>(
      () => _i234.GetCurrentUser(gh<_i534.AuthRepository>()),
    );
    gh.singleton<_i683.Login>(() => _i683.Login(gh<_i534.AuthRepository>()));
    gh.singleton<_i70.Register>(
      () => _i70.Register(gh<_i534.AuthRepository>()),
    );
    gh.singleton<_i651.ResendOtp>(
      () => _i651.ResendOtp(gh<_i534.AuthRepository>()),
    );
    gh.singleton<_i412.ResetPassword>(
      () => _i412.ResetPassword(gh<_i534.AuthRepository>()),
    );
    gh.singleton<_i32.ValidateOtp>(
      () => _i32.ValidateOtp(gh<_i534.AuthRepository>()),
    );
    gh.singleton<_i174.VerifyEmail>(
      () => _i174.VerifyEmail(gh<_i534.AuthRepository>()),
    );
    gh.lazySingleton<_i77.ReviewCubit>(
      () => _i77.ReviewCubit(gh<_i315.GetReviews>(), gh<_i212.AddReview>()),
    );
    gh.singleton<_i445.AuthCubit>(
      () => _i445.AuthCubit(
        gh<_i70.Register>(),
        gh<_i683.Login>(),
        gh<_i174.VerifyEmail>(),
        gh<_i478.ForgotPassword>(),
        gh<_i651.ResendOtp>(),
        gh<_i32.ValidateOtp>(),
        gh<_i412.ResetPassword>(),
        gh<_i234.GetCurrentUser>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i212.RegisterModule {}
